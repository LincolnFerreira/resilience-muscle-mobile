import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../ui/box_text.dart';
import '../../../../../../ui/colors.dart';
import '../../../../../core/organisms_default/button_organism.dart';
import '../atoms/onboarding_screen_atom.dart';

class OnboardingRegistrationTraining extends StatelessWidget {
  const OnboardingRegistrationTraining({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const OnboardingScreenAtom(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Divider(
                height: 104,
              ),
              BoxText.headingOne(
                'Informações essenciais',
                color: ColorsUI.white,
              ),
              const Divider(
                height: 88,
              ),
              LottieBuilder.asset(
                'assets/images/calendar.json',
                width: 300,
                height: 300,
                fit: BoxFit.fill,
              ),
              const Divider(
                height: 72,
              ),
              const Text(
                'Atualmente como está seu treino ?',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const Divider(
                height: 38,
              ),
              ButtonOrganism.primary(
                textButton: 'Iniciar',
                backgroundColor: Colors.white,
                textColor: ColorsUI.primary,
                width: 232,
                onPressed: () =>
                    Modular.to.pushNamed('/registration_info_user/'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
