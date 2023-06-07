import 'package:resilience_muscle/app/modules/registration_info_user/registration_info_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cubit/registration_info_user_cubit.dart';

class RegistrationInfoUserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<RegistrationInfoUserCubit>(
        (i) => RegistrationInfoUserCubit()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const RegistrationInfoUserPage(),
    ),
  ];
}
