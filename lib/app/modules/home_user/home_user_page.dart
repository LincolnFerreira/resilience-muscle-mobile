import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resilience_muscle/app/modules/home_user/atomic/organisms/box_ready_training_organism.dart';

import 'package:resilience_muscle/app/modules/home_user/atomic/organisms/menu_bottom_navbar_organism.dart';
import 'package:resilience_muscle/app/modules/home_user/atomic/organisms/menu_top_navbar_organism.dart';
import 'package:resilience_muscle/app/modules/home_user/home_user_store.dart';

import '../../core/colors.dart';

class HomeUserPage extends StatefulWidget {
  const HomeUserPage({super.key});

  @override
  HomeUserPageState createState() => HomeUserPageState();
}

class HomeUserPageState extends State<HomeUserPage> {
  final HomeUserStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 40, right: 30, bottom: 30, left: 30),
        // ignore: sort_child_properties_last
        child: Column(
          children: [
            const MenuTopNavbarOrganism(),
            const SizedBox(
              height: 30,
            ),
            SizedBoxRetangular(
              height: 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Pallete.darkless,
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      // const SizedBoxItem(

                      //   title: 'Frequência',
                      //   data: '7',
                      //   fontSize: 30,
                      //   colorFont: Pallete.white,
                      // ),
                      // SizedBoxItem(
                      //   title: 'Treino de hoje',
                      //   data: 'Peito',
                      //   fontSize: 30,
                      //   colorFont: Pallete.green,
                      // ),
                      // SizedBoxItem(
                      //   title: 'Status',
                      //   data: '😀',
                      //   fontSize: 30,
                      //   colorFont: Pallete.green,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const BoxReadyTrainingOrganism(),
            // ),
            // Container(
            //   padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            //   width: double.infinity,
            //   height: 200,
            //   child: LineChart(
            //     LineChartData(
            //       //**** texto
            //       titlesData: FlTitlesData(show: false),
            //       backgroundColor: Colors.transparent,
            //       gridData: FlGridData(show: false),
            //       // showingTooltipIndicators: List.empty(growable: false),
            //       borderData: FlBorderData(show: false),
            //       lineBarsData: [
            //         LineChartBarData(
            //           spots: [
            //             const FlSpot(0, 1),
            //             const FlSpot(1, 3),
            //             const FlSpot(2, 10),
            //             const FlSpot(3, 7),
            //             const FlSpot(4, 12),
            //             const FlSpot(5, 13),
            //             const FlSpot(6, 17),
            //             const FlSpot(7, 15),
            //             const FlSpot(8, 20)
            //           ],
            //           belowBarData: BarAreaData(show: false),
            //           isCurved: true,
            //           color: Colors.red,

            //           // * preventCurveOverShooting: true,
            //           // isStepLineChart: true,
            //           // isStrokeCapRound: true,
            //           // isStrokeJoinRound: true,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: MenuBottomNavbarOrganism(
        selectedItemColor: Pallete.white,
        unselectedItemColor: Pallete.whiteGrey,
        backgroundColor: Colors.transparent,
        faIconOne: IconButton(
          icon: const Icon(FontAwesomeIcons.house),
          iconSize: 25,
          onPressed: () {
            Modular.to.navigate('/home_user/');
          },
        ),
        faIconTwo: IconButton(
          icon: const Icon(FontAwesomeIcons.calendarCheck),
          iconSize: 25,
          onPressed: () {
            Modular.to.navigate('');
          },
        ),
        faIconThree: IconButton(
          icon: const Icon(FontAwesomeIcons.chartLine),
          iconSize: 25,
          onPressed: () {
            Modular.to.navigate('');
          },
        ),
        faIconFour: IconButton(
          icon: const Icon(FontAwesomeIcons.gear),
          iconSize: 25,
          onPressed: () {
            Modular.to.navigate('/settings/');
          },
        ),
      ),
    );
  }
}

class SizedBoxRetangular extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;

  const SizedBoxRetangular({
    Key? key,
    required this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: child,
    );
  }
}

class SizedBoxItem extends StatelessWidget {
  final String title = '-';
  final String data;
  final double fontSize;
  final Color colorFont;

//40 size
  const SizedBoxItem({
    super.key,
    required this.data,
    required this.fontSize,
    required this.colorFont,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      // width: 121,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w100,
              color: Pallete.white,
            ),
          ),
          Text.rich(
            TextSpan(
              text: data,
              style: TextStyle(
                color: colorFont,
                fontSize: fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
