import 'package:resilience_muscle/app/presentation/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const SplashPage(),
    ),
  ];
}
