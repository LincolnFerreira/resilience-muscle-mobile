// import 'package:fl_chart/fl_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../ui/colors.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String name = "Cecilía Sousa";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 65, 15, 20),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Bem vinda,\n',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                      children: [
                        TextSpan(
                          text: ' Cecília Sousa',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: const Icon(
                      Icons.notifications,
                      color: ColorsUI.white,
                      size: 33,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBoxRetangular(
                largura: 100,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: ColorsUI.darkless,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBoxItem(
                          // title: 'Frequência',
                          data: '7',
                          fontSize: 40,
                          colorFont: ColorsUI.white,
                        ),
                        SizedBoxItem(
                          // title: 'Treino de hoje',
                          data: 'Peito',
                          fontSize: 30,
                          colorFont: ColorsUI.green,
                        ),
                        SizedBoxItem(
                          // title: 'Status',
                          data: '😀',
                          fontSize: 30,
                          colorFont: ColorsUI.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                width: double.infinity,
                height: 200,
                child: LineChart(
                  LineChartData(
                    //**** texto
                    titlesData: FlTitlesData(show: false),
                    backgroundColor: Colors.transparent,
                    gridData: FlGridData(show: false),
                    // showingTooltipIndicators: List.empty(growable: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 1),
                          const FlSpot(1, 3),
                          const FlSpot(2, 10),
                          const FlSpot(3, 7),
                          const FlSpot(4, 12),
                          const FlSpot(5, 13),
                          const FlSpot(6, 17),
                          const FlSpot(7, 15),
                          const FlSpot(8, 20)
                        ],
                        belowBarData: BarAreaData(show: false),
                        isCurved: true,
                        color: Colors.red,

                        // * preventCurveOverShooting: true,
                        // isStepLineChart: true,
                        // isStrokeCapRound: true,
                        // isStrokeJoinRound: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: ColorsUI.white,
        // unselectedLabelStyle:
        //     TextStyle(color: Colors.white, backgroundColor: Colors.white),
        unselectedItemColor: Colors.white38,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: FaIcon(
                FontAwesomeIcons.house,
                size: 20,
              ),
              label: "Inicio"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
                size: 20,
              ),
              label: "Calendário"),
          BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: FaIcon(
                FontAwesomeIcons.chartLine,
                size: 20,
              ),
              label: "Performance"),
          BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: FaIcon(
                FontAwesomeIcons.gear,
                size: 20,
              ),
              label: "Configurações"),
        ],
      ),
    );
  }
}

class SizedBoxRetangular extends StatelessWidget {
  final Widget child;
  final double largura;

  const SizedBoxRetangular({
    super.key,
    required this.largura,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: largura,
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
    required this.data,
    required this.fontSize,
    required this.colorFont,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: 121,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w100,
              color: ColorsUI.white,
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
