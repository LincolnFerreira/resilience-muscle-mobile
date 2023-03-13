import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import '../../../../../ui/colors.dart';

import '../../../../core/atom_default/dot_atom.dart';
import '../../../../core/atom_default/space_widget_atom.dart';
import '../../../../core/organisms_default/button_organism.dart';

class RegistrationInfoUserGender extends StatelessWidget {
  const RegistrationInfoUserGender({super.key});

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
                    color: ColorsUI.primary,
                  ),
                ),
                const DotAtom(
                  activeIndex: 3,
                  count: 6,
                ),
              ],
            ),
            const SpaceWidgetAtom(height: 40),
            const SpaceWidgetAtom(height: 54),
            ButtonOrganism.primary(
              textButton: 'Confirmar',
              onPressed: () {
                Modular.to.navigate('nextPage');
              },
              width: 232,
            )
          ],
        ),
      ),
    );
  }
}
