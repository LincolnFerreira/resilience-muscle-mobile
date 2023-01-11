import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/colors.dart';

class MenuBottomNavbarOrganism extends StatelessWidget {
  final double? elevation;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Color? backgroundItens;
  final Color? backgroundColor;
  final IconButton faIconOne;
  final IconButton faIconTwo;
  final IconButton faIconThree;
  final IconButton faIconFour;

  const MenuBottomNavbarOrganism({
    Key? key,
    this.elevation,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.backgroundItens,
    this.backgroundColor,
    required this.faIconOne,
    required this.faIconTwo,
    required this.faIconThree,
    required this.faIconFour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: selectedItemColor,
      // unselectedLabelStyle:
      //     TextStyle(color: Colors.white, backgroundColor: Colors.white),
      unselectedItemColor: unselectedItemColor,
      items: [
        BottomNavigationBarItem(
          backgroundColor: backgroundColor,
          icon: faIconOne,
          label: "Inicio",
        ),
        BottomNavigationBarItem(
          backgroundColor: backgroundColor,
          icon: faIconTwo,
          label: "Calendário",
        ),
        BottomNavigationBarItem(
          backgroundColor: backgroundColor,
          icon: const FaIcon(
            FontAwesomeIcons.solidSquarePlus,
            size: 36,
            color: Pallete.green,
          ),
          label: "Criar",
        ),
        BottomNavigationBarItem(
            backgroundColor: backgroundColor,
            icon: faIconThree,
            label: "Performance"),
        BottomNavigationBarItem(
            backgroundColor: backgroundColor,
            icon: faIconFour,
            label: "Configurações"),
      ],
    );
  }
}
