import 'package:resilience_muscle/app/modules/registration_info_user/registration_info_user_page.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/registration_info_user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'atomic/organisms/registration_info_user_birth_date.dart';
import 'atomic/organisms/registration_info_user_height.dart';
import 'atomic/organisms/registration_info_user_name.dart';
import 'atomic/organisms/registration_info_user_weight.dart';

class RegistrationInfoUserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegistrationInfoUserStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const RegistrationInfoUserPage(),
    ),
    ChildRoute(
      '/name',
      child: (_, args) => const RegistrationInfoUserName(),
    ),
    ChildRoute(
      '/birth_date',
      child: (_, args) => const RegistrationInfoUserBirthDate(),
    ),
    ChildRoute(
      '/height',
      child: (_, args) => const RegistrationInfoUserHeight(),
    ),
    ChildRoute(
      '/weight',
      child: (_, args) => const RegistrationInfoUserWeight(),
    ),
  ];
}
