import 'package:resilience_muscle/app/modules/registration_info_user/registration_info_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegistrationInfoUserModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const RegistrationInfoUserPage(),
    ),
  ];
}
