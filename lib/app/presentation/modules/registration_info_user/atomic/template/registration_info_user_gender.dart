import 'package:flutter/material.dart';
import 'package:resilience_muscle/app/core/atom_default/input_atom.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import 'package:resilience_muscle/app/core/colors.dart';

class RegistrationInfoUserGender extends StatelessWidget {
  const RegistrationInfoUserGender({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const TextAtom(
            text: 'Como podemos te chamar?',
            textColor: Pallete.dark,
            fontSize: 22),
      ],
    );
  }
}
