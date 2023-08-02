import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../atomic/template/registration_info_user_template.dart';
import '../cubits/registration_info_user_cubit.dart';
import '../cubits/registration_info_user_state.dart';

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
    'height': 0.0,
    'weight': 0.0,
    'password': '',
    'confirmPassword': '',
  };

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationInfoUserCubit, RegistrationInfoUserState>(
      bloc: cubit,
      listener: (context, state) => {
        if (state is RegistrationInfoUserSuccess &&
            state.createdNewCollumns == true)
          {
            Modular.to.pushNamed('/home_user/'),
          }
      },
      builder: (context, state) => RegistrationInfoUserTemplate(
        onPressedBackPage: () {
          Modular.to.pushNamed('/login/');
        },
        currentPage: state.page ?? 4,
        inputValues: inputValues,
        onTapButtonContinue: cubit.onTapButtonContinue,
        onPressedRegisterInfoUser: () => cubit.registerInfoUser(
          birthDate: inputValues['birthDate'],
          height: inputValues['height'],
          name: inputValues['name'],
          weight: inputValues['weight'],
        ),
        validatorName: cubit.validateName,
        validatorBirthDate: cubit.validateBirthDate,
        //TODO: ALTERAR PARA STATE DE IMAGEM
        imageUrl: state.imageSelectedProfile,
        onTapImageProfile: cubit.onTapImageProfile,
        onPressedContinueToTraining: cubit.onTapContinueToTraing,
        onClickImageSelected: cubit.changeImageSelected,
      ),
    );
  }
}
