import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/data/datasources/remote/firebase/sign_in_datasource_firebase_imp.dart';
import 'package:resilience_muscle/app/data/repositories/sign_in_repository_imp.dart';
import 'package:resilience_muscle/app/domain/usecases/sign_in/sign_in_usecase_imp.dart';
import 'package:resilience_muscle/app/presentation/modules/forget_password/forget_password_module.dart';
import 'package:resilience_muscle/app/presentation/modules/home/home_module.dart';
import 'package:resilience_muscle/app/presentation/modules/splash/splash_module.dart';

import 'app/presentation/modules/settings/settings_module.dart';
import 'app/presentation/modules/home_user/home_user_module.dart';
import 'app/presentation/modules/login/cubit/sign_in_cubit.dart';
import 'app/presentation/modules/login/login_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // Bind(i() => SignInDataSourceFirebaseImp()),
        Bind((i) => SignInRepositoryImp(
            signInDataSourceFireBaseImp: SignInDataSourceFirebaseImp())),
        Bind((i) => SignInUseCaseImp(i())),
        Bind.singleton((i) => SignInCubit(i())),
      ];

  @override
  List<ModuleRoute> get routes => [
        ModuleRoute(
          '/',
          module: SplashModule(),
          transition: TransitionType.rightToLeft,
          duration: const Duration(milliseconds: 500),
        ),
        ModuleRoute(
          '/login',
          module: LoginModule(),
          transition: TransitionType.fadeIn,
          duration: const Duration(milliseconds: 500),
        ),
        ModuleRoute(
          '/home',
          module: HomeModule(),
          transition: TransitionType.fadeIn,
          duration: const Duration(milliseconds: 500),
        ),
        ModuleRoute(
          '/home_user',
          module: HomeUserModule(),
          transition: TransitionType.fadeIn,
          duration: const Duration(milliseconds: 500),
        ),
        ModuleRoute(
          '/forget_password',
          module: ForgetPasswordModule(),
        ),
        ModuleRoute(
          '/settings',
          module: SettingsModule(),
        )
      ];
}
