import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resilience_muscle/app/core/atom_default/input_atom.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import 'package:resilience_muscle/app/core/colors.dart';

class RegistrationInfoUserName extends StatelessWidget {
  const RegistrationInfoUserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextAtom(
          text: 'Como podemos te chamar?',
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const InputAtom(labelText: 'Nome:')
      ],
    );
  }
}
