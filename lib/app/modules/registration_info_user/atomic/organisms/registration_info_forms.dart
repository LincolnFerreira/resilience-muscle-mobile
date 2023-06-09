import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:resilience_muscle/app/core/atom_default/input_atom.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';

import '../../../../core/atom_default/space_widget_atom.dart';
import '../../../../core/organisms_default/button_organism.dart';

class RegistrationInfoForms extends StatelessWidget {
  final VoidCallback? onPressed;
  final Function(String)? onChangeInput;
  final formKey = GlobalKey<FormState>();
  final String? titleForm;
  final String? formSubtitle;
  final String inputLabelText;
  final String? Function(String?)? validator;
  final String? textButton;

  RegistrationInfoForms({
    Key? key,
    this.onPressed,
    this.onChangeInput,
    this.titleForm,
    required this.formSubtitle,
    required this.inputLabelText,
    this.validator,
    this.textButton,
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
                text: titleForm ?? '',
                style: GoogleFonts.roboto(fontSize: 24),
                textAlign: TextAlign.start,
              ),
            ),
            const SpaceWidgetAtom(height: 20),
            TextAtom(
              text: formSubtitle ?? '',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SpaceWidgetAtom(height: 20),
            Form(
              key: formKey,
              child: InputAtom(
                labelText: inputLabelText,
                prefixIcon: const FaIcon(Icons.person),
                onChanged: onChangeInput,
                validator: validator,
              ),
            ),
          ],
        ),
        const SpaceWidgetAtom(height: 54),
        ButtonOrganism.primary(
          textButton: textButton ?? 'Confirmar',
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              onPressed?.call();
            }
          },
          width: 232,
        ),
      ],
    );
  }
}
