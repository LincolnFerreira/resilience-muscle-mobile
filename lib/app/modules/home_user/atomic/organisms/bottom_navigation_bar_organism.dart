import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../ui/colors.dart';
import '../../../../../ui/resources/assets.dart';

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
          icon: InkWell(
            onTap: () {
              Modular.to.navigate('/home_user/');
            },
            child: SvgPicture.asset(
              'assets/appIcons/dumble.svg',
              height: 24,
            ),
          ),
          label: 'Treino',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              // Ação a ser executada ao clicar no ícone
            },
            child: SvgPicture.asset(
              AssetsCollection.eventAvailableSvg(),
              height: 24,
            ),
          ),
          label: 'Acompanhamento',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/appIcons/bar_chart.svg',
              height: 24,
            ),
          ),
          label: 'Performace',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              Modular.to.navigate('/settings/');
            },
            child: SvgPicture.asset(
              'assets/appIcons/user.svg',
              height: 24,
            ),
          ),
          label: 'Conta',
        ),
      ],
    );
  }
}
