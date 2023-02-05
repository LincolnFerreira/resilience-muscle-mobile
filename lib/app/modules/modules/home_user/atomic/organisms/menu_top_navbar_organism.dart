import 'package:flutter/material.dart';
import '../../../../../core/colors.dart';
import '../../../../home_user/atomic/atom/rich_text_atom.dart';

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
            color: Pallete.white,
            size: 33,
          ),
        ),
      ],
    );
  }
}
