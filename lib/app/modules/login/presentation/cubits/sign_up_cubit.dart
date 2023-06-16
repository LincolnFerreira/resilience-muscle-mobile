import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../registration_info_user/presenter/usecases/create_new_user_with_email_usecase.dart';
import '../usecase/is_email_duplicate_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final IsEmailDuplicateUsecase isEmailDuplicateUsecase;
  final CreateNewUserWithEmailUsecase createNewUserWithEmail;

  SignUpCubit({
    required this.isEmailDuplicateUsecase,
    required this.createNewUserWithEmail,
  }) : super(SignUpInitial());

  String? externalError;
  bool isValidateConfirmPassword = false;

  Future<void> submitSignUp({
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());

    final resEmail = await isEmailDuplicateUsecase.isEmailDuplicate(email);
    resEmail.fold(
      (failure) {
        externalError = 'Email já utilizado.';
        emit(SignUpFailure(externalError!));
      },
      (response) {
        externalError = null;
        emit(const SignUpSuccess(createdNewUser: false));
      },
    );

    final resSignUp = await createNewUserWithEmail(email, password);
    resSignUp.fold(
      (failure) {
        emit(const SignUpFailure('Falha ao realizar o cadastro.'));
      },
      (signUp) {
        emit(const SignUpSuccess(createdNewUser: true));
      },
    );
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu e-mail.';
    }

    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, insira um e-mail válido.';
    }

    if (externalError != null) {
      return externalError;
    }

    return null; // Retorna null se o valor for válido
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira sua senha.';
    }
    // Aqui você pode adicionar a validação específica para a senha, se necessário
    return null; // Retorna null se o valor for válido
  }

  String? validateConfirmPassword(
      {required String? password, required String? confirmPassword}) {
    if (password == null ||
        confirmPassword == null ||
        confirmPassword.isEmpty) {
      return 'Por favor, confirme sua senha.';
    }

    if (password != confirmPassword) {
      return 'As senhas não coincidem.';
    }
    return null; // Retorna null se o valor for válido
  }

  void onPressedBackPage() {
    Modular.to.pushNamed('/login');
  }
}
