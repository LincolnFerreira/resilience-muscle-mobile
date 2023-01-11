import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resilience_muscle/app/presentation/modules/login/organisms/form_sign_in_organism.dart';
import 'package:asuka/asuka.dart' as asuka;

import '../../../core/colors.dart';
import '../../../core/organisms_default/button_organism.dart';
import 'cubit/sign_in_cubit.dart';
import 'cubit/sign_in_state.dart';

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
          Future.delayed(const Duration(seconds: 5),
              () => Modular.to.navigate('/home_user/'));
        }
        if (state.status == SignInStatus.failure) {
          asuka.AsukaSnackbar.alert("erro de login").show();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Pallete.white,
              onPressed: () {
                Modular.to.navigate('/');
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: Container(
            margin: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FormSignInOrganism(
                  spaceBetweenInputOrganism: 20,
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
                      width: double.infinity,
                      onPressed: () async {
                        cubit.submitSignIn(
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      textButton: 'Confirmar',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        bottom: 30,
                      ),
                      child: SizedBox(
                        child: Row(
                          children: const [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              ' or ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ButtonOrganism(
                      textButton: 'Entrar com Google',
                      backgroundColor: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.google,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text('Continuar com google'),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    // ),
    // );
  }
}
