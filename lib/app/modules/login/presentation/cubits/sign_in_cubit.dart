// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:resilience_muscle/app/modules/login/presentation/cubits/sign_in_state.dart';

import '../../domain/entities/user_entity.dart';
import '../usecase/is_info_user_collections_exists_usecase.dart';
import '../usecase/is_sign_in_usecase.dart';
import '../usecase/sign_in_usecase.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase signInUseCase;
  final IsSignInUseCase isSignInUseCase;
  final IsInfoUserCollectionsExistsUsecase isInfoUserCollectionsExistsUsecase;

  SignInCubit({
    required this.signInUseCase,
    required this.isSignInUseCase,
    required this.isInfoUserCollectionsExistsUsecase,
  }) : super(SignInInitial());

  Future<void> submitSignIn(String email, String password) async {
    emit(SignInLoading());
    validateEmail(email);
    validatePassword(password);
    try {
      final signIn =
          await signInUseCase(UserEntity(email: email, password: password));

      signIn.fold(
        (failure) {
          emit(SignInFailure(failure.message));
        },
        (right) async {
          await isCreatedCollumnsInfoUser(right.uid);
        },
      );
    } catch (e) {
      emit(SignInFailure('erro desconhecido'));
    }
  }

  Future<void> isCreatedCollumnsInfoUser(String uid) async {
    try {
      final res = await isInfoUserCollectionsExistsUsecase(uid: uid);
      res.fold(
        (failure) => null,
        (isInfoUserCollectionsExistsUsecase) => {
          emit(
            SignInSuccess(
              isCreatedCollumnsInfoUser: isInfoUserCollectionsExistsUsecase,
            ),
          ),
        },
      );
    } catch (e) {}
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || value == '') {
      return 'Por favor, insira seu e-mail.';
    }

    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, insira um e-mail válido.';
    }

    return null; // Retorna null se o valor for válido
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value == '') {
      return 'Por favor, insira sua senha.';
    }
    return null;
  }
}
