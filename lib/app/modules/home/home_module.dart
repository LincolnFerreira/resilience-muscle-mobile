import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const HomePage(),
    )
  ];
}
