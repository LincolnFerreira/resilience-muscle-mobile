import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/is_email_duplicate_usecase.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/cubits/registration_info_user_state.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/usecases/create_new_user_with_email_usecase.dart';

class RegistrationInfoUserCubit extends Cubit<RegistrationInfoUserState> {
  final IsEmailDuplicateUsecase isEmailDuplicateUsecase;
  final CreateNewUserWithEmailUsecase createNewUserWithEmail;

  RegistrationInfoUserCubit({
    required this.createNewUserWithEmail,
    required this.isEmailDuplicateUsecase,
  }) : super(const RegistrationInfoUserInitial(page: 0));

  final TextEditingController textController = TextEditingController();

  void onTapButtonContinue() {
    emit(RegistrationInfoUserSuccess(newPage: state.page + 1));
  }

  bool isValidateConfirmPassword = false;
  String? externalError;

  Future<void> submitSignUp({
    required String name,
    required String birthDate,
    required double height,
    required double weight,
    required String email,
    required String password,
  }) async {
    final resEmail = await isEmailDuplicateUsecase.isEmailDuplicate(email);
    resEmail.fold(
      (failure) => {
        externalError = 'Email já utilizado.',
        validateEmail(email),
      },
      (response) => {
        if (response == false)
          {
            externalError = null,
          }
      },
    );
    final resSignUp = await createNewUserWithEmail(email, password);
    resSignUp.fold((failure) {},
        (signUp) => emit(RegistrationInfoUserSuccess(createdNewUser: true)));
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu nome.';
    }

    final nameRegExp = RegExp(r'^[a-zA-Z ]+$');
    if (!nameRegExp.hasMatch(value) || value.length < 3) {
      return 'Por favor, insira um nome válido.';
    }

    return null;
  }

  String? validateBirthDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira sua data de nascimento.';
    }

    // Aqui você pode adicionar a validação específica para a data de nascimento, se necessário

    return null; // Retorna null se o valor for válido
  }

  String? validateWeight(double value) {
    if (value <= 0) {
      return 'Por favor, insira um peso válido.';
    }

    return null; // Retorna null se o valor for válido
  }

  String? validateHeight(double value) {
    if (value <= 0) {
      return 'Por favor, insira uma altura válida.';
    }

    return null; // Retorna null se o valor for válido
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
    if (externalError == null) {
      return null;
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
    emit(RegistrationInfoUserSuccess(
      isValidateConfirmPassword: true,
    ));
    return null; // Retorna null se o valor for válido
  }
}
