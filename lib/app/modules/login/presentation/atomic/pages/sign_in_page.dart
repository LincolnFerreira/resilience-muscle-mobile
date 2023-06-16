import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/login/presentation/atomic/templates/sign_in_template.dart';

import '../../cubits/sign_in_cubit.dart';
import '../../cubits/sign_in_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    Key? key,
  }) : super(key: key);

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    super.initState();
  }

  final cubit = Modular.get<SignInCubit>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is SignInLoading) {
          asuka.AsukaSnackbar.message("verificando...").show();
        }

        if (state is SignInSuccess) {
          asuka.AsukaSnackbar.success("sucesso").show();
          state.isCreatedCollumnsInfoUser
              ? Modular.to.pushNamed('/home_user/')
              : Modular.to.pushNamed('/registration_info_user/');
        }

        if (state is SignInFailure) {
          asuka.AsukaSnackbar.alert(state.message ?? "erro de login").show();
        }
      },
      builder: (context, state) {
        return SignInTemplate(
          emailController: emailController,
          passwordController: passwordController,
          onChangedEmail: (e) => email = e,
          onChangedPassword: (e) => password = e,
          validatorEmail: cubit.validateEmail,
          validatorPassword: cubit.validatePassword,
          onTapSignIn: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            cubit.submitSignIn(
              emailController.text,
              passwordController.text,
            );
          },
          onTapCreateSignUp: () => Modular.to.pushNamed('/login/sign_up'),
          textOnTapSignIn: 'Entrar',
          onTapForgetPassword: () => Modular.to.pushNamed('/forget_password'),
        );
      },
    );
  }
}
