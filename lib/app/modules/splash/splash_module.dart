import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const SplashPage(),
    ),
  ];
}
