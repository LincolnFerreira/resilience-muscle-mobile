import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/presentation/modules/login/sign_in_page.dart';
import 'package:resilience_muscle/app/presentation/modules/login/sign_up_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    // Bind.lazySingleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SignInPage()),
    ChildRoute('/signUp', child: (_, args) => const SignUpPage()),
  ];
}
