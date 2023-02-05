import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/atom_default/text_atom.dart';
import '../../../../core/colors.dart';

class WelcomeLabelOrganism extends StatelessWidget {
  const WelcomeLabelOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextAtom(
            text: 'Bem vindo(a)',
            style: GoogleFonts.roboto(
                color: Pallete.dark, fontWeight: FontWeight.w400, fontSize: 25),
          ),
          TextAtom(
            text: 'Entre para continuar!',
            style: GoogleFonts.roboto(
              color: Pallete.dark,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
