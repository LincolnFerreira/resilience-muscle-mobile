import 'package:flutter/material.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import 'package:resilience_muscle/app/core/colors.dart';

class RegistrationInfoUserTrainingDivision extends StatelessWidget {
  const RegistrationInfoUserTrainingDivision({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: const [
        TextAtom(
            text: 'Como são divididos seus treinos?',
            textColor: Pallete.dark,
            fontSize: 22),
        //TODO: semanalmente e sequencialmente widget de seleção
      ],
    );
  }
}
