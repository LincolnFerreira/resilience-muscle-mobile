// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:resilience_muscle/app/core/atom_default/input_atom.dart';
import 'package:resilience_muscle/app/core/atom_default/space_widget_atom.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import 'package:resilience_muscle/app/core/colors.dart';

import '../../../../core/organisms_default/button_organism.dart';
import '../../../../core/validator_functions.dart';

class RegistrationInfoUserBirthDate extends StatelessWidget {
  final VoidCallback? onPressed;
  const RegistrationInfoUserBirthDate({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: TextAtom(
              text: 'Qual sua data de nascimento ?',
              textColor: Pallete.dark,
              fontSize: 22),
        ),
        const SpaceWidgetAtom(height: 20),
        InputAtom(
          labelText: 'labelText',
          inputFormatter: [maskFormatter],
          keyboardType: TextInputType.number,
        ),
        const SpaceWidgetAtom(height: 54),
        ButtonOrganism.primary(
          textButton: 'Confirmar',
          onPressed: onPressed!,
          width: 232,
        )
      ],
    );
  }
}
