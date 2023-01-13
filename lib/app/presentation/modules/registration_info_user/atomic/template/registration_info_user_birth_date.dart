import 'package:flutter/material.dart';
import 'package:resilience_muscle/app/core/atom_default/input_atom.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import 'package:resilience_muscle/app/core/colors.dart';
import 'package:validatorless/validatorless.dart';

class RegistrationInfoUserBirthDate extends StatelessWidget {
  const RegistrationInfoUserBirthDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextAtom(
            text: 'Qual sua data de nascimento ?',
            textColor: Pallete.dark,
            fontSize: 22),
        InputAtom(
          labelText: 'Data de nascimento:',
          validator: Validatorless.date('data invalida'),
        ),
      ],
    );
  }
}
