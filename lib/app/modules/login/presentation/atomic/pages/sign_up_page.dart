import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../cubits/sign_up_cubit.dart';
import '../templates/sign_up_template.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final cubit = Modular.get<SignUpCubit>();

  String email = '';
  String password = '';
  String confirmPassword = '';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess && state.createdNewUser == true) {
          Modular.to.pushNamed('/login/');
        }
      },
      bloc: cubit,
      builder: (context, state) {
        return SignUpTemplate(
          onPressedButtonSubmitSignUp: () =>
              cubit.submitSignUp(email: email, password: password),
          onChangeInputEmail: (e) => email = e,
          onChangeInputPassword: (e) => password = e,
          onChangeInputConfirmPassword: (e) => confirmPassword = e,
          titleForm: '',
          inputLabelTextEmail: 'Email:',
          inputLabelTextPassword: 'Senha:',
          inputLabelTextConfirmPassword: 'Confirme a senha:',
          onPressedBackPage: cubit.onPressedBackPage,
        );
      },
    );
  }
}
