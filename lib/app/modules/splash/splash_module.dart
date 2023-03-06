import 'package:resilience_muscle/app/modules/registration_info_user/submodules/theme_option_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      // child: (_, args) => const SplashPage(),
      child: (_, args) => const ThemeOptionPage(),
    ),
  ];
}
