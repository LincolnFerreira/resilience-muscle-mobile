import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:resilience_muscle/app/core/organisms_default/button_organism.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/atomic/atoms/onboarding_screen_atom.dart';
import 'package:resilience_muscle/ui/box_text.dart';

import '../../../../../../ui/colors.dart';

class OnboardingEssentialInformation extends StatelessWidget {
  const OnboardingEssentialInformation({super.key});

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
                'Olá! Para ajudá-lo(a) melhor,\n precisamos de algumas informações...',
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
