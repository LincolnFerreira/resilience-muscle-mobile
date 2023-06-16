// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../core/atom_default/logo_atom.dart';
import '../atomics/button_google_atom.dart';
import '../atomics/or_atom.dart';
import '../organisms/bottom_text_version_screen_organism.dart';
import '../organisms/dont_have_an_account_organism.dart';
import '../organisms/form_sign_in_organism.dart';
import '../organisms/welcome_label_organism.dart';

class SignInTemplate extends StatelessWidget {
  final Function(String)? onChangedEmail;
  final Function(String)? onChangedPassword;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final VoidCallback onTapSignIn;
  final String textOnTapSignIn;
  final VoidCallback onTapCreateSignUp;
  final VoidCallback onTapForgetPassword;
  final String? Function(String?)? validatorEmail;
  final String? Function(String?)? validatorPassword;

  const SignInTemplate({
    Key? key,
    this.onChangedEmail,
    this.onChangedPassword,
    this.emailController,
    this.passwordController,
    required this.onTapSignIn,
    required this.textOnTapSignIn,
    required this.onTapCreateSignUp,
    required this.onTapForgetPassword,
    this.validatorEmail,
    this.validatorPassword,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        key: UniqueKey(),
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
                validatorEmail: validatorEmail,
                spaceBetweenInputOrganism: 24,
                onChangedEmail: onChangedEmail,
                onChangedPassword: onChangedPassword,
                emailController: emailController,
                passwordController: passwordController,
                onTapForgetPassword: onTapForgetPassword,
                onTapSignIn: onTapSignIn,
                validatorPassword: validatorPassword,
              ),
              Column(
                children: [
                  const OrAtom(),
                  const ButtonGoogleAtom(),
                  const Divider(
                    height: 20,
                    color: Colors.transparent,
                  ),
                  DontHaveAnAccountOrganism(
                      onTapCreateSignUp: onTapCreateSignUp),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomTextVersionScreenOrganism(),
    );
  }
}
