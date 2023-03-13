import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../ui/colors.dart';
import '../../../../core/atom_default/text_atom.dart';
import '../../../../core/organisms_default/button_organism.dart';

class ButtonGoogleAtom extends StatelessWidget {
  const ButtonGoogleAtom({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonOrganism(
      textButton: 'Entrar com Google',
      backgroundColor: ColorsUI.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/google.svg',
            height: 37,
          ),
          const SizedBox(
            width: 15,
          ),
          const TextAtom(text: 'Continue with google'),
        ],
      ),
      onPressed: () {},
    );
  }
}
