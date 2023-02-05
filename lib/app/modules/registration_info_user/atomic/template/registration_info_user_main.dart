// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resilience_muscle/app/core/atom_default/dot_atom.dart';
import 'package:resilience_muscle/app/core/atom_default/space_widget_atom.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import 'package:resilience_muscle/app/core/organisms_default/button_organism.dart';

import '../../../../core/colors.dart';

class RegistrationInfoUserMain extends StatelessWidget {
  final Widget registrationPageStep;
  final int currentStep;
  const RegistrationInfoUserMain({
    Key? key,
    required this.currentStep,
    required this.registrationPageStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextAtom(
                  text: 'Informações de usuário',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: Pallete.primary,
                  ),
                ),
                const DotAtom(activeIndex: 0, count: 6),
              ],
            ),
            const SpaceWidgetAtom(height: 40),
            registrationPageStep,
            const SpaceWidgetAtom(height: 54),
            ButtonOrganism.primary(
              textButton: 'Confirmar',
              onPressed: () {},
              width: 232,
            )
          ],
        ),
      ),
    );
  }
}
