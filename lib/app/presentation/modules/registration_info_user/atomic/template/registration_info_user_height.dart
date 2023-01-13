import 'package:flutter/material.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import 'package:resilience_muscle/app/core/colors.dart';

class RegistrationInfoUserHeight extends StatelessWidget {
  const RegistrationInfoUserHeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextAtom(
            text: 'Qual sua altura?', textColor: Pallete.dark, fontSize: 22),
      ],
    );
  }
}
