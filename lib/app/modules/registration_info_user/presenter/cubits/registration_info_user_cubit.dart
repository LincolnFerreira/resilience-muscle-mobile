import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/is_email_duplicate_usecase.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/cubits/registration_info_user_state.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/usecases/create_collections_info_user_usecase.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/usecases/create_new_user_with_email_usecase.dart';

class RegistrationInfoUserCubit extends Cubit<RegistrationInfoUserState> {
  final IsEmailDuplicateUsecase isEmailDuplicateUsecase;
  final CreateNewUserWithEmailUsecase createNewUserWithEmail;
  final CreateCollectionsInfoUserUsecase createCollectionsInfoUserUsecase;

  RegistrationInfoUserCubit({
    required this.createCollectionsInfoUserUsecase,
    required this.createNewUserWithEmail,
    required this.isEmailDuplicateUsecase,
  }) : super(const RegistrationInfoUserInitial(page: 0));

  void onTapButtonContinue() {
    emit(RegistrationInfoUserSuccess(newPage: state.page + 1));
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

  registerInfoUser(
      {required birthDate,
      required double height,
      required name,
      required double weight}) {}
}
