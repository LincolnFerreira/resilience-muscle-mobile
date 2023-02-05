import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/core/colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: Asuka.builder,
      title: 'Resilience Muscle',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      // darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
        scaffoldBackgroundColor: Pallete.white,
        textTheme: const TextTheme(),
        primaryColor: Colors.red,
        //visualDensity pesquisar sobre
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      // color: Pallete.dark,
    );
    // },
    // );
  }
}
