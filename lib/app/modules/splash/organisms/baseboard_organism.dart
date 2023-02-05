import 'package:flutter/material.dart';

import '../../../core/atom_default/text_atom.dart';
import '../../../core/colors.dart';

class BaseboardOrganism extends StatelessWidget {
  const BaseboardOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        // context,
        // MaterialPageRoute(builder: (context)),
        // );
      },
      child: const TextAtom(
        text: 'Todos os direitos reservados © Copyright 2022',
        textColor: Pallete.white,
        fontWeight: FontWeight.w300,
        fontSize: 13.5,
        textAlign: TextAlign.center,
        fontFamily: 'Jura',
      ),
    );
  }
}
