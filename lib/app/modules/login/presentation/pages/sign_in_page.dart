import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/atom_default/logo_atom.dart';
import '../../../../core/atom_default/space_widget_atom.dart';
import '../../../../core/organisms_default/button_organism.dart';
import '../atomic/atomics/button_google_atom.dart';
import '../atomic/atomics/or_atom.dart';
import '../atomic/organisms/bottom_text_version_screen_organism.dart';
import '../atomic/organisms/dont_have_an_account_organism.dart';
import '../atomic/organisms/form_sign_in_organism.dart';
import '../atomic/organisms/welcome_label_organism.dart';
import '../cubits/sign_in_cubit.dart';
import '../cubits/sign_in_state.dart';

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
        if (state.status == SignInStatus.loading) {
          asuka.AsukaSnackbar.message("verificando...").show();
        }
        if (state.status == SignInStatus.success) {
          asuka.AsukaSnackbar.success("sucesso").show();
          Future.delayed(const Duration(seconds: 1),
              () => Modular.to.navigate('/home_user/'));
        }
        if (state.status == SignInStatus.failure) {
          asuka.AsukaSnackbar.alert("erro de login").show();
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const LogoAtom(),
                const WelcomeLabelOrganism(),
                FormSignInOrganism(
                  spaceBetweenInputOrganism: 28,
                  onChangedEmail: (emailValue) {
                    email = emailController.text;
                  },
                  onChangedPassword: (passwordValue) {
                    password = passwordController.text;
                  },
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                Column(
                  children: [
                    ButtonOrganism.primary(
                      width: 232,
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        cubit.submitSignIn(
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      textButton: 'Entrar',
                    ),
                    const OrAtom(),
                    const ButtonGoogleAtom(),
                    const SpaceWidgetAtom(height: 20),
                    DontHaveAnAccountOrganism(
                      onTapSignUp: () =>
                          Modular.to.popAndPushNamed('/login/sign_up'),
                    )
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: const BottomTextVersionScreenOrganism(),
        );
      },
    );
  }
}
