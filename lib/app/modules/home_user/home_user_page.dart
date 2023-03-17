import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/home_user/atomic/organisms/card_today_training_organism.dart';
import 'package:resilience_muscle/app/modules/home_user/atomic/organisms/navbar_top_user_organism.dart';

import 'package:resilience_muscle/app/modules/home_user/home_user_store.dart';
import 'package:resilience_muscle/ui/typography.dart';

import '../../../ui/box_text.dart';

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
                    BoxText.headingOne(
                      'Treinos',
                    ),
                    const Divider(
                      height: 21,
                      color: Colors.transparent,
                    ),
                    const CardTodayTrainingOrganism(
                      textTrainingDay: 'Hoje',
                      cardTrainingText: "Peito & Delt.Posterior",
                      urlTraining: "assets/images/training-chest-original.jpg",
                      opacity: 0.4,
                    ),
                    const Divider(
                      height: 16,
                    ),
                    Row(
                      children: const [
                        CardTodayTrainingOrganism(
                          textTrainingDay: 'Hoje',
                          cardTrainingText: "Peito & Delt.Posterior",
                          urlTraining:
                              "assets/images/training-chest-original.jpg",
                          width: 180,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CardTodayTrainingOrganism(
                          textTrainingDay: 'Hoje',
                          cardTrainingText: "Peito & Delt.Posterior",
                          urlTraining:
                              "assets/images/training-chest-original.jpg",
                          width: 180,
                        ),
                      ],
                    ),
                    const Divider(
                      height: 16,
                    ),
                    Row(
                      children: const [
                        CardTodayTrainingOrganism(
                          textTrainingDay: 'Hoje',
                          cardTrainingText: "Peito & Delt.Posterior",
                          urlTraining:
                              "assets/images/training-chest-original.jpg",
                          width: 180,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CardTodayTrainingOrganism(
                          textTrainingDay: 'Hoje',
                          cardTrainingText: "Peito & Delt.Posterior",
                          urlTraining:
                              "assets/images/training-chest-original.jpg",
                          width: 180,
                          opacity: 0.6,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
