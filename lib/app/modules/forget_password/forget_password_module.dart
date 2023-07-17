import 'package:flutter_modular/flutter_modular.dart';

import 'forget_password_page.dart';

class ForgetPasswordModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ForgetPasswordPage()),
  ];
}
