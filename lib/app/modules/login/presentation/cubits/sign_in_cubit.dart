import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import 'package:resilience_muscle/app/modules/login/presentation/cubits/sign_in_state.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/usecases/create_collections_info_user_usecase.dart';

import '../../domain/entities/user_entity.dart';
import '../usecase/get_current_uid_usecase.dart';
import '../usecase/get_current_user_usecase.dart';
import '../usecase/is_sign_in_usecase.dart';
import '../usecase/save_current_usecase.dart';
import '../usecase/sign_in_usecase.dart';
import '../usecase/sign_out_usecase.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase signInUseCase;
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUIdUseCase getCurrentUIdUseCase;
  final SignOutUsecase signOutUseCase;
  final SaveCurrentUserUseCase saveCurrentUserUseCase;
  final GetCurrentUserUsecase getCurrentUserUsecase;
  final CreateCollectionsInfoUserUsecase collectionsInfoUserUsecase;

  SignInCubit({
    // this.signInRepository,
    required this.signInUseCase,
    required this.isSignInUseCase,
    required this.getCurrentUIdUseCase,
    required this.signOutUseCase,
    required this.saveCurrentUserUseCase,
    required this.getCurrentUserUsecase,
    required this.collectionsInfoUserUsecase,
  }) : super(SignInState.initial());

  final Logger logger = Logger();
  void loading() {
    emit(state.copyWith(status: SignInStatus.loading));
  }

  Future<void> submitSignIn(String email, String password) async {
    emit(state.copyWith(status: SignInStatus.loading));

    try {
      final signIn =
          await signInUseCase(UserEntity(email: email, password: password));

      signIn.fold(
        (failure) {
          emit(state.copyWith(status: SignInStatus.failure));
        },
        (right) async {
          emit(state.copyWith(
            status: SignInStatus.success,
          ));
          saveUser(right);
          getCurrentUser(right.uid);
        },
      );
    } catch (_) {
      emit(state.copyWith(status: SignInStatus.failure));
    }
  }

  Future<void> getCurrentUser(String uid) async {
    final getCurrentUser = await getCurrentUserUsecase(uid);
    print(getCurrentUser);
  }

  Future<void> saveUser(UserEntity currentUser) async {
    await saveCurrentUserUseCase(currentUser);
  }

  Future<void> appStarted() async {
    //   try {
    //     final isSignIn = await isSignInUseCase.call();
    //     if (isSignIn) {
    //       final uid = await getCurrentUIdUseCase.getCurrentUId();
    //       logger.i('uid: $uid');
    //     } else {
    //       logger.i('deslogado');
    //     }
    //   } on SocketException catch (_) {
    //     logger.i('deslogado catch');
    //   }
    // }
  }

  Future<void> createdCollumnsInfoUser() async {
    try {
      await collectionsInfoUserUsecase();
    } catch (e) {}
  }
}
