import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/login/presentation/sign_in_page.dart';
import 'package:resilience_muscle/app/modules/login/presentation/sign_up_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    // Bind.lazySingleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SignInPage()),
    ChildRoute('/signUp', child: (_, args) => const SignUpPage()),
  ];
}
