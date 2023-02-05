import 'package:resilience_muscle/app/modules/home_user/home_user_page.dart';
import 'package:resilience_muscle/app/modules/home_user/home_user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeUserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeUserStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomeUserPage()),
  ];
}
