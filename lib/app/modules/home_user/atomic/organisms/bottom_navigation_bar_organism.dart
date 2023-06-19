import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../ui/colors.dart';
import '../../../../../ui/resources/assets.dart';

enum PageName {
  home,
  attendance,
  performance,
  account,
}

class BottomNavigationBarOrganism extends StatefulWidget {
  final PageName currentPage;

  const BottomNavigationBarOrganism({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  @override
  _BottomNavigationBarOrganismState createState() =>
      _BottomNavigationBarOrganismState();
}

final pageRoutes = {
  PageName.home: '/home_user/',
  PageName.attendance: '/home_user/attendance/',
  PageName.performance: '/home_user/performance/',
  PageName.account: '/home_user/settings/',
};

class _BottomNavigationBarOrganismState
    extends State<BottomNavigationBarOrganism> {
  late PageName selectedItem = widget.currentPage;

  SvgPicture getSvgIcon(String assetName, PageName selectedItem) {
    final isSelected = this.selectedItem == selectedItem;
    final color = isSelected ? ColorsUI.dark : ColorsUI.whiteGrey;

    return SvgPicture.asset(
      assetName,
      height: 24,
      color: color,
    );
  }

  void updateSelectedItem(PageName selectedItem) {
    setState(() {
      this.selectedItem = selectedItem;
    });
    Modular.to.pushNamed(pageRoutes[selectedItem]!);
  }

  late int _selectedIndex = widget.currentPage.index;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          updateSelectedItem(PageName.home);
          break;
        case 1:
          updateSelectedItem(PageName.attendance);
          break;
        case 2:
          updateSelectedItem(PageName.performance);
          break;
        case 3:
          updateSelectedItem(PageName.account);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 1,
      key: UniqueKey(),
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(
        color: ColorsUI.dark,
      ),
      selectedItemColor: ColorsUI.dark,
      unselectedItemColor: ColorsUI.dark63,
      unselectedIconTheme: IconThemeData(color: ColorsUI.dark63),
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: getSvgIcon('assets/appIcons/dumble.svg', PageName.home),
          label: 'Treino',
        ),
        BottomNavigationBarItem(
          icon: getSvgIcon(
              AssetsCollection.eventAvailableSvg(), PageName.attendance),
          label: 'Acompanhamento',
        ),
        BottomNavigationBarItem(
          icon:
              getSvgIcon('assets/appIcons/bar_chart.svg', PageName.performance),
          label: 'Performace',
        ),
        BottomNavigationBarItem(
          icon: getSvgIcon('assets/appIcons/user.svg', PageName.account),
          label: 'Conta',
        ),
      ],
    );
  }
}
