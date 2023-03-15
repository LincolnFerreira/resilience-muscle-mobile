import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:resilience_muscle/app/core/atom_default/input_atom.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';

import '../../../../../../ui/colors.dart';

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
        SizedBox(
          child: InputAtom(
            height: 48,
            labelText: 'Email:',
            prefixIcon: FaIcon(
              FontAwesomeIcons.solidUser,
              color: ColorsUI.grey80,
            ),
            onChanged: onChangedEmail,
            controller: emailController,
          ),
        ),
        SizedBox(height: spaceBetweenInputOrganism ?? 10.0),
        InputAtom(
          height: 48,
          labelText: 'Senha:',
          prefixIcon: FaIcon(
            FontAwesomeIcons.shield,
            color: ColorsUI.grey80,
          ),
          suffixIcon: FaIcon(
            FontAwesomeIcons.eyeLowVision,
            size: 15,
            color: ColorsUI.grey80,
          ),
          obscureText: true,
          onChanged: onChangedPassword,
          controller: passwordController,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              child: TextAtom(
                text: 'Esqueceu sua senha?',
                textColor: ColorsUI.dark63,
                fontSize: 13,
              ),
              onTap: () => Modular.to.navigate('/forget_password'),
            ),
          ),
        )
      ],
    );
  }
}
