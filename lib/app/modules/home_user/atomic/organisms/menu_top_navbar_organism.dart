import 'package:flutter/material.dart';
import 'package:resilience_muscle/app/modules/home_user/atomic/atom/rich_text_atom.dart';

import '../../../../../ui/colors.dart';

class MenuTopNavbarOrganism extends StatelessWidget {
  const MenuTopNavbarOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const RichTextAtom(
          textWelcome: 'Bem vinda,\n',
          textNameUser: 'Lincoln Ferreira',
        ),
        GestureDetector(
          child: const Icon(
            Icons.notifications,
            color: ColorsUI.white,
            size: 33,
          ),
        ),
      ],
    );
  }
}
