import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/atomic/template/registration_info_user_template.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/cubit/registration_info_user_cubit.dart';
import 'package:flutter/material.dart';

import 'cubit/registration_info_user_state.dart';

class RegistrationInfoUserPage extends StatefulWidget {
  const RegistrationInfoUserPage({super.key});

  @override
  RegistrationInfoUserPageState createState() =>
      RegistrationInfoUserPageState();
}

class RegistrationInfoUserPageState extends State<RegistrationInfoUserPage> {
  final cubit = Modular.get<RegistrationInfoUserCubit>();

  Map<String, dynamic> inputValues = {
    'name': '',
    'birthDate': '',
    'email': '',
    'height': 0,
    'weight': 0,
    'password': '',
    'confirmPassword': '',
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationInfoUserCubit, RegistrationInfoUserState>(
      bloc: cubit,
      builder: (context, state) => RegistrationInfoUserTemplate(
        onPressedBackPage: () {
          Modular.to.popAndPushNamed('/login/');
        },
        currentPage: state.page,
        inputValues: inputValues,
        onTapButtonContinue: cubit.onTapButtonContinue,
        onPressedSubmitSignUp: () => cubit.submitSignUp(
          birthDate: inputValues['birthDate'],
          email: inputValues['email'],
          height: 0.0,
          name: inputValues['name'],
          password: inputValues['password'],
          weight: 0.0,
        ),
        validatorName: cubit.validateName,
        validatorBirthDate: cubit.validateBirthDate,
        validatorEmail: cubit.validateEmail,
        validatorPassword: cubit.validatePassword,
      ),
    );
  }
}
