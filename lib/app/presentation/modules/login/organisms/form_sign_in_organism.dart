import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:resilience_muscle/app/core/atom_default/input_atom.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import 'package:resilience_muscle/subs/class/cores.dart';

class FormSignInOrganism extends StatelessWidget {
  final double? spaceBetweenInputOrganism;
  final Function(String)? onChangedEmail;
  final Function(String)? onChangedPassword;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  const FormSignInOrganism({
    Key? key,
    this.spaceBetweenInputOrganism,
    this.onChangedEmail,
    this.onChangedPassword,
    this.emailController,
    this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InputAtom(
          labelText: 'Email',
          prefixIcon: const FaIcon(
            FontAwesomeIcons.solidUser,
            color: Pallete.whiteGrey,
          ),
          onChanged: onChangedEmail,
          controller: emailController,
        ),
        SizedBox(height: spaceBetweenInputOrganism ?? 10.0),
        InputAtom(
          labelText: 'Senha',
          prefixIcon: const FaIcon(
            FontAwesomeIcons.shield,
            color: Pallete.whiteGrey,
          ),
          suffixIcon: const FaIcon(
            FontAwesomeIcons.eyeLowVision,
            size: 15,
            color: Pallete.whiteGrey,
          ),
          obscureText: true,
          onChanged: onChangedPassword,
          controller: passwordController,
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            child: const TextAtom(
              text: 'Esqueceu sua senha?',
              textColor: Pallete.whiteGrey,
              fontSize: 13,
            ),
            onTap: () => Modular.to.navigate('/forget_password'),
          ),
        )
      ],
    );
  }
}
