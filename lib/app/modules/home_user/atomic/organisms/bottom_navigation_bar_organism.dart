import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../ui/colors.dart';
import '../../../../../ui/resources/assets.dart';

class BottomNavigationBarOrganism extends StatefulWidget {
  const BottomNavigationBarOrganism({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarOrganismState createState() =>
      _BottomNavigationBarOrganismState();
}

class _BottomNavigationBarOrganismState
    extends State<BottomNavigationBarOrganism> {
  String getSelectItem = '/home_user/';

  final String pushNamedHomeUser = '/home_user/';
  final String pushNamedAttendance = './attendance/';
  final String pushNamedPerformance = './performance/';
  final String pushNamedAccount = './settings/';

  SvgPicture getSvgIcon(String assetName, String selectedItem) {
    final isSelected = getSelectItem == selectedItem;
    final color = isSelected ? ColorsUI.dark : ColorsUI.whiteGrey;

    return SvgPicture.asset(
      assetName,
      height: 24,
      color: color,
    );
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
      selectedFontSize: 16,
      items: [
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              setState(() {
                getSelectItem = pushNamedHomeUser;
              });
              Modular.to.pushNamed(pushNamedHomeUser);
            },
            child: getSvgIcon('assets/appIcons/dumble.svg', pushNamedHomeUser),
          ),
          label: 'Treino',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              setState(() {
                getSelectItem = pushNamedAttendance;
              });
              Modular.to.pushNamed(pushNamedAttendance);
            },
            child: getSvgIcon(
                AssetsCollection.eventAvailableSvg(), pushNamedAttendance),
          ),
          label: 'Acompanhamento',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              setState(() {
                getSelectItem = pushNamedPerformance;
              });
              Modular.to.pushNamed(pushNamedPerformance);
            },
            child: getSvgIcon(
                'assets/appIcons/bar_chart.svg', pushNamedPerformance),
          ),
          label: 'Performace',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              setState(() {
                getSelectItem = pushNamedAccount;
              });
              Modular.to.pushNamed(pushNamedAccount);
            },
            child: getSvgIcon('assets/appIcons/user.svg', pushNamedAccount),
          ),
          label: 'Conta',
        ),
      ],
    );
  }
}
