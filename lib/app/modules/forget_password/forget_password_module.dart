import 'package:resilience_muscle/app/modules/forget_password/forget_password_page.dart';
import 'package:resilience_muscle/app/modules/forget_password/forget_password_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ForgetPasswordModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ForgetPasswordStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ForgetPasswordPage()),
  ];
}
