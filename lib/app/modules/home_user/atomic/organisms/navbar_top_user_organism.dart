import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../ui/box_text.dart';
import '../../../../../ui/colors.dart';
import '../atom/circle_avatar_user.dart';

class NavbarTopUserOrganism extends StatefulWidget {
  final String nameUser;
  final String fraseInteligente;
  final String imageProfileUser;

  const NavbarTopUserOrganism({
    Key? key,
    required this.nameUser,
    required this.fraseInteligente,
    required this.imageProfileUser,
  }) : super(key: key);

  @override
  State<NavbarTopUserOrganism> createState() => _NavbarTopUserOrganismState();
}

class _NavbarTopUserOrganismState extends State<NavbarTopUserOrganism> {
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
              CircleAvatarUserAtom(
                imageProfileUser: widget.imageProfileUser,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoxText.bodyTwo(
                    'Bem vindo ${widget.nameUser}',
                  ),
                  const Divider(
                    height: 4,
                    color: Colors.transparent,
                  ),
                  BoxText.caption(
                    widget.fraseInteligente,
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
