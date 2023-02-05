import 'package:flutter_modular/flutter_modular.dart';

import 'app/modules/forget_password/forget_password_module.dart';
import 'app/modules/home/home_module.dart';
import 'app/modules/home_user/home_user_module.dart';
import 'app/modules/login/data/datasources/remote/firebase/firebase_remote_datasource_imp.dart';
import 'app/modules/login/data/repositories/get_current_uid_repository_imp.dart';
import 'app/modules/login/data/repositories/is_sign_in_repository_imp.dart';
import 'app/modules/login/data/repositories/sign_in_repository_imp.dart';
import 'app/modules/login/data/repositories/sign_out_repository_imp.dart';
import 'app/modules/login/domain/usecases/get_current_uid/get_current_uid_usecase_imp.dart';
import 'app/modules/login/domain/usecases/is_sign_in/is_sign_in_usecase_imp.dart';
import 'app/modules/login/domain/usecases/sign_in/sign_in_usecase_imp.dart';
import 'app/modules/login/domain/usecases/sign_out/sign_out_usecase_imp.dart';
import 'app/modules/login/login_module.dart';
import 'app/modules/login/presentation/cubit/sign_in_cubit.dart';
import 'app/modules/registration_info_user/registration_info_user_module.dart';
import 'app/modules/settings/settings_module.dart';
import 'app/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        //firebase
        Bind((i) => FirebaseRemoteDataSourceImp()),

        //repository
        Bind((i) => SignInRepositoryImp(firebaseRemoteDataSource: i())),
        Bind((i) => IsSignInRepositoryImp(firebaseRemoteDataSource: i())),
        Bind((i) => GetCurrentUIdRepositoryImp(firebaseRemoteDataSource: i())),
        Bind((i) => SignOutRepositoryImp(firebaseRemoteDataSource: i())),

        //usecase
        Bind((i) => SignInUseCaseImp(signInRepository: i())),
        Bind.factory((i) => IsSignInUseCaseImp(isSignInRepository: i())),
        Bind((i) => GetCurrentUIdUseCaseImp(getCurrentUIdRepository: i())),
        Bind((i) => SignOutUseCaseImp(signOutRepository: i())),

        //cubit
        Bind.singleton((i) => SignInCubit(i(), i(), i(), i())),
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
        ),
        ModuleRoute(
          '/registration_info_user',
          module: RegistrationInfoUserModule(),
        )
      ];
}
