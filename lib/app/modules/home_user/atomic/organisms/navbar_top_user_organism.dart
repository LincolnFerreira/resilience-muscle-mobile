import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../ui/box_text.dart';
import '../../../../../ui/colors.dart';
import '../atom/circle_avatar_user.dart';

class NavbarTopUserOrganism extends StatelessWidget {
  final String nameUser;
  final String fraseInteligente;
  const NavbarTopUserOrganism({
    Key? key,
    required this.nameUser,
    required this.fraseInteligente,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsUI.white,
      elevation: 0.1,
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CircleAvatarUserAtom(
                  imageProfileUser: 'assets/images/dev-training.jpeg'),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoxText.body(
                    'Bem vindo $nameUser',
                  ),
                  const Divider(
                    height: 4,
                    color: Colors.transparent,
                  ),
                  BoxText.bodyTwo(
                    fraseInteligente,
                  ),
                ],
              ),
            ],
          ),
          const Icon(
            Icons.notifications,
            color: ColorsUI.dark,
            size: 30,
          )
        ],
      ),
    );
  }
}
