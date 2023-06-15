import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:resilience_muscle/app/core/atom_default/input_atom.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';

import '../../../../../../ui/colors.dart';

class FormSignInOrganism extends StatefulWidget {
  final double? spaceBetweenInputOrganism;
  final Function(String)? onChangedEmail;
  final Function(String)? onChangedPassword;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final VoidCallback onTapForgetPassword;

  const FormSignInOrganism({
    Key? key,
    this.spaceBetweenInputOrganism,
    this.onChangedEmail,
    this.onChangedPassword,
    this.emailController,
    this.passwordController,
    required this.onTapForgetPassword,
  }) : super(key: key);

  @override
  _FormSignInOrganismState createState() => _FormSignInOrganismState();
}

class _FormSignInOrganismState extends State<FormSignInOrganism> {
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          child: InputAtom(
            height: 48,
            labelText: 'Email:',
            prefixIcon: Icon(
              Icons.person,
              color: ColorsUI.grey80,
            ),
            onChanged: widget.onChangedEmail,
            controller: widget.emailController,
          ),
        ),
        SizedBox(height: widget.spaceBetweenInputOrganism ?? 10.0),
        InputAtom(
          height: 48,
          labelText: 'Senha:',
          prefixIcon: Icon(
            Icons.key,
            color: ColorsUI.grey80,
          ),
          suffixIcon: InkWell(
            onTap: _togglePasswordVisibility,
            child: FaIcon(
              _obscurePassword
                  ? FontAwesomeIcons.eyeLowVision
                  : FontAwesomeIcons.eye,
              size: 15,
              color: ColorsUI.grey80,
            ),
          ),
          obscureText: _obscurePassword,
          onChanged: widget.onChangedPassword,
          controller: widget.passwordController,
        ),
        const Divider(
          height: 16,
          color: Colors.transparent,
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            child: TextAtom(
              text: 'Esqueceu sua senha?',
              textColor: ColorsUI.dark63,
              fontSize: 13,
            ),
            onTap: widget.onTapForgetPassword,
          ),
        )
      ],
    );
  }
}
