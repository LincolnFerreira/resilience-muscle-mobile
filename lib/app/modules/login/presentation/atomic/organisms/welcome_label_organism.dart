import 'package:flutter/material.dart';
import 'package:resilience_muscle/ui/typography.dart';

import '../../../../../core/atom_default/text_atom.dart';

class WelcomeLabelOrganism extends StatelessWidget {
  const WelcomeLabelOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextAtom(
            text: 'Bem vindo(a)',
            style: heading3Style,
          ),
          const Divider(
            height: 8,
            color: Colors.transparent,
          ),
          TextAtom(
            text: 'Vamos continuar nossa jornada!',
            style: bodyStyle,
          )
        ],
      ),
    );
  }
}
