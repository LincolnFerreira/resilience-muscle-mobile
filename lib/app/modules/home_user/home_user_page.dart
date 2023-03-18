import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/home_user/atomic/organisms/card_today_training_organism.dart';
import 'package:resilience_muscle/app/modules/home_user/atomic/organisms/navbar_top_user_organism.dart';

import 'package:resilience_muscle/app/modules/home_user/home_user_store.dart';
import 'package:resilience_muscle/ui/colors.dart';

import '../../../ui/box_text.dart';
import 'atomic/organisms/bottom_navigation_bar_organism.dart';

class HomeUserPage extends StatefulWidget {
  const HomeUserPage({super.key});

  @override
  HomeUserPageState createState() => HomeUserPageState();
}

class HomeUserPageState extends State<HomeUserPage> {
  final HomeUserStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: NavbarTopUserOrganism(
              nameUser: 'nameUser',
              fraseInteligente: 'fraseInteligente',
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoxText.headingTwo(
                      'Treinos',
                    ),
                    const Divider(
                      height: 21,
                      color: Colors.transparent,
                    ),
                    //TODO: criar listbuilder com usecase
                    CardTodayTrainingOrganism(
                      textTrainingDay: 'HOJE',
                      urlTraining: "assets/images/training-chest-original.jpg",
                      opacity: 0.4,
                      boxText: BoxText.heading(
                        'Peito & Delt.Posterior',
                        color: ColorsUI.white,
                      ),
                    ),
                    const Divider(
                      height: 16,
                    ),
                    Row(
                      children: [
                        CardTodayTrainingOrganism(
                          textTrainingDay: 'AMANHÃ (TREINO B)',
                          urlTraining:
                              "assets/images/training-chest-original.jpg",
                          width: 180,
                          color: ColorsUI.whiteGrey,
                          boxText: BoxText.body(
                            'Costas & Delt. Anterior',
                            color: ColorsUI.white.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CardTodayTrainingOrganism(
                          textTrainingDay: 'TREINO C',
                          urlTraining:
                              "assets/images/training-chest-original.jpg",
                          width: 180,
                          color: ColorsUI.whiteGrey,
                          boxText: BoxText.body(
                            'Bíceps & Tríceps',
                            color: ColorsUI.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 16,
                    ),
                    Row(
                      children: [
                        CardTodayTrainingOrganism(
                          textTrainingDay: 'TREINO D',
                          urlTraining:
                              "assets/images/training-chest-original.jpg",
                          width: 180,
                          color: ColorsUI.whiteGrey,
                          boxText: BoxText.body(
                            'Quadríceps',
                            color: ColorsUI.white.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CardTodayTrainingOrganism(
                          textTrainingDay: 'TREINO E',
                          urlTraining:
                              "assets/images/training-chest-original.jpg",
                          width: 180,
                          opacity: 0.6,
                          color: ColorsUI.whiteGrey,
                          boxText: BoxText.body(
                            'Abdômen & Cardio',
                            color: ColorsUI.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: const BottomNavigationBarOrganism(),
        );
      },
    );
  }
}
