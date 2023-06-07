import 'package:flutter_modular/flutter_modular.dart';

import 'cubit/home_user_cubit.dart';
import 'home_user_page.dart';

class HomeUserModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<HomeUserCubit>(
            (i) => HomeUserCubit(userEntityBox: i())),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomeUserPage()),
  ];
}
