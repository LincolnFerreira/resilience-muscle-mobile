// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:resilience_muscle/app/core/atom_default/input_atom.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';

import '../../../../core/atom_default/space_widget_atom.dart';
import '../../../../core/organisms_default/button_organism.dart';

class RegistrationInfoUserName extends StatelessWidget {
  final VoidCallback? onPressed;

  const RegistrationInfoUserName({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SpaceWidgetAtom(height: 40),
        Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextAtom(
                text: 'Como prefere ser chamado ?',
                style: GoogleFonts.roboto(fontSize: 24),
                textAlign: TextAlign.start,
              ),
            ),
            const SpaceWidgetAtom(height: 20),
            TextAtom(
              text:
                  'Vamos utilizar essa informação para se comunicar melhor com você',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SpaceWidgetAtom(height: 20),
            const InputAtom(
              labelText: 'nome:',
              prefixIcon: FaIcon(Icons.person),
            ),
          ],
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
