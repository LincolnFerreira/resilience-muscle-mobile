import 'package:flutter/material.dart';
import 'package:resilience_muscle/app/core/atom_default/text_atom.dart';
import 'package:resilience_muscle/app/presentation/modules/splash/atomic/polygon_atom.dart';

import '../../../../../subs/class/cores.dart';

class WelcomeLabelOrganism extends StatelessWidget {
  const WelcomeLabelOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            PolygonAtom(
              alignment: const Alignment(0.1, 0.0),
              rotateAngle: 2,
              width: 17,
            ),
          ],
        ),
        TextAtom(
          text: 'Bem vindo(a)!',
          fontFamily: 'Jura',
          textColor: Colors.white,
          fontSize: 30,
        ),
        PolygonAtom(
            alignment: AlignmentDirectional.bottomStart,
            rotateAngle: 5,
            width: 13),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: TextAtom(
            text: 'vamos mudar o modo como'
                '\n vê seus resultados!',
            textColor: Pallete.whiteGrey,
            fontFamily: 'Jura',
            fontWeight: FontWeight.w100,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
