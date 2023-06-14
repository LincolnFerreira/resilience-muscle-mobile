// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_info_entity.dart';

import 'package:resilience_muscle/app/modules/login/presentation/cubits/sign_in_state.dart';
import 'package:resilience_muscle/app/modules/login/presentation/cubits/user_cubit.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/usecases/create_collections_info_user_usecase.dart';

import '../../domain/entities/user_entity.dart';
import '../usecase/get_current_uid_usecase.dart';
import '../usecase/get_current_user_usecase.dart';
import '../usecase/is_info_user_collections_exists_usecase.dart';
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
  final UserCubit userCubit;
  final IsInfoUserCollectionsExistsUsecase isInfoUserCollectionsExistsUsecase;

  SignInCubit({
    required this.signInUseCase,
    required this.isSignInUseCase,
    required this.getCurrentUIdUseCase,
    required this.signOutUseCase,
    required this.saveCurrentUserUseCase,
    required this.getCurrentUserUsecase,
    required this.collectionsInfoUserUsecase,
    required this.userCubit,
    required this.isInfoUserCollectionsExistsUsecase,
  }) : super(SignInInitial());

  final Logger logger = Logger();

  Future<void> submitSignIn(String email, String password) async {
    emit(SignInLoading());

    try {
      final signIn =
          await signInUseCase(UserEntity(email: email, password: password));

      signIn.fold(
        (failure) {
          emit(SignInFailure());
        },
        (right) async {
          emit(SignInSuccess(newUserEntity: right));
          saveUser(right);
          getCurrentUser(right.uid);
          userCubit.updateUser(right);
          isCreatedCollumnsInfoUser(right.uid);
        },
      );
    } catch (_) {
      emit(SignInFailure());
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

  Future<void> createdCollumnsInfoUser(UserInfoEntity userInfoEntity) async {
    try {
      if (state.userEntity?.uid == null) {
        return;
      }
      final res = await collectionsInfoUserUsecase(
        uid: state.userEntity!.uid,
        userInfoEntity: userInfoEntity,
      );
      res.fold(
        (failure) {},
        (createdCollumns) {
          print('createdCollumns: $createdCollumns');
        },
      );
    } catch (e) {}
  }

  Future<void> isCreatedCollumnsInfoUser(String uid) async {
    try {
      final res = await isInfoUserCollectionsExistsUsecase(uid: uid);
      res.fold(
        (failure) => null,
        (isInfoUserCollectionsExistsUsecase) => emit(SignInSuccess(
          newIsInfoUserCollectionsExistsUsecase:
              isInfoUserCollectionsExistsUsecase,
        )),
      );
      print('res: $res');
      print('resState: ${state.isInfoUserCollectionsExistsUsecase}');
    } catch (e) {}
  }
}
