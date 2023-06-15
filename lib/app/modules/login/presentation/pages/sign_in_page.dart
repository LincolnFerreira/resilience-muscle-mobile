import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/atom_default/logo_atom.dart';
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
        if (state is SignInLoading) {
          asuka.AsukaSnackbar.message("verificando...").show();
        }

        if (state is SignInSuccess) {
          asuka.AsukaSnackbar.success("sucesso").show();
          state.isCreatedCollumnsInfoUser!
              ? Modular.to.navigate('/home_user/')
              : Modular.to.navigate('/registration_info_user/');
        }

        if (state is SignInFailure) {
          asuka.AsukaSnackbar.alert("erro de login").show();
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Divider(
                    height: 40,
                    color: Colors.transparent,
                  ),
                  const LogoAtom(),
                  const Divider(
                    height: 64,
                    color: Colors.transparent,
                  ),
                  const WelcomeLabelOrganism(),
                  const Divider(
                    height: 56,
                    color: Colors.transparent,
                  ),
                  FormSignInOrganism(
                    spaceBetweenInputOrganism: 32,
                    onChangedEmail: (emailValue) {
                      email = emailController.text;
                    },
                    onChangedPassword: (passwordValue) {
                      password = passwordController.text;
                    },
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  const Divider(
                    height: 70,
                    color: Colors.transparent,
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
                      const Divider(
                        height: 20,
                        color: Colors.transparent,
                      ),
                      DontHaveAnAccountOrganism(
                        onTapSignUp: () =>
                            Modular.to.popAndPushNamed('/login/sign_up'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: const BottomTextVersionScreenOrganism(),
        );
      },
    );
  }
}
