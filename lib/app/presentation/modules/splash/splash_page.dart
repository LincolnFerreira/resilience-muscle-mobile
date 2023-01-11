import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/presentation/modules/splash/organisms/baseboard_organism.dart';
import 'package:resilience_muscle/app/presentation/modules/splash/organisms/welcome_label_organism.dart';
import 'package:resilience_muscle/app/presentation/modules/splash/splash_store.dart';
import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/organisms_default/button_organism.dart';
import '../../../core/atom_default/logo_atom.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Pallete.gradientDark.withOpacity(0.95),
              Pallete.gradientWhite.withOpacity(0.7),
            ], begin: Alignment.topCenter),
          ),
          child: Container(
            margin: const EdgeInsets.all(30),
            child: Column(
              children: [
                const Spacer(flex: 1),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: LogoImageWidget(),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          WelcomeLabelOrganism(),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ButtonOrganism.primary(
                        width: 150,
                        heigth: 45,
                        textButton: 'Continuar',
                        textColor: Colors.white,
                        onPressed: () {
                          Modular.to.navigate('login/');
                        },
                      ),
                    ],
                  ),
                ),
                const BaseboardOrganism(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
