import 'package:resilience_muscle/app/modules/home_user/home_user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cubit/home_user_cubit.dart';
import 'home_user_page.dart';

class HomeUserModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeUserStore()),
        Bind.lazySingleton<HomeUserCubit>((i) => HomeUserCubit()),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomeUserPage()),
  ];
}
