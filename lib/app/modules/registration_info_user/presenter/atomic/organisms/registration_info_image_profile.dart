import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/atom_default/space_widget_atom.dart';
import '../../../../../core/atom_default/text_atom.dart';

class RegistrationInfoImageProfile extends StatelessWidget {
  final String? titleForm;
  final String? formSubtitle;
  const RegistrationInfoImageProfile({
    super.key,
    this.titleForm,
    this.formSubtitle,
  });

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
          ],
        )
      ],
    );
  }
}
