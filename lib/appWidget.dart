import 'package:flutter/material.dart';
import 'app/controllers/widgetControllers/switch_controller.dart';
import 'app/views/cadastro_page.dart';
import 'app/views/homeUser_page.dart';
import 'app/views/onboard_page.dart';
import 'app/views/setting_page.dart';
import 'class/cores.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: SwitchController.instance,
      builder: (context, child) {
        return MaterialApp(
          title: 'Resilience Muscle',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // brightness: SwitchController.instance.isDarkTheme
            //     ? Brightness.dark
            //     : Brightness.light,
            scaffoldBackgroundColor: Pallete.dark,
            fontFamily: 'Inter',
            textTheme: const TextTheme(
              headline1: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: 'Inter',
              ),
            ),
            primaryColor: Colors.red,
            //visualDensity pesquisar sobre
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          color: Pallete.white,
          routes: {
            '/': (context) => const OnboardPage(),
            '/cadastroUser': (context) => CadastroPage(),
            '/homeUser': (context) => const HomeUserPage(),
            '/settingPage': (context) => const SettingPage(),
          },
        );
      },
    );
  }
}
