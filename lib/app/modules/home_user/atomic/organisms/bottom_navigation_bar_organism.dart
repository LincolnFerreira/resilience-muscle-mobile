import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../ui/colors.dart';

class BottomNavigationBarOrganism extends StatelessWidget {
  const BottomNavigationBarOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(
        color: ColorsUI.primary,
      ),
      selectedItemColor: ColorsUI.primary,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/appIcons/dumble.svg',
            height: 24,
          ),
          label: 'Treino',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/appIcons/event_available.svg',
            height: 24,
          ),
          label: 'Acompanhamento',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/appIcons/bar_chart.svg',
            height: 24,
          ),
          label: 'Performace',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/appIcons/user.svg',
            height: 24,
          ),
          label: 'Conta',
        ),
      ],
    );
  }
}
