import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/get_current_uid_repository.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/is_sign_in_repository.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/sign_in_repository.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/sign_out_repository.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/get_current_uid/get_current_uid_usecase.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/is_sign_in/is_sign_in_usecase.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/sign_out/sign_out_usecase.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/cubit/registration_info_user_cubit.dart';
import 'package:resilience_muscle/app/modules/splash/splash_module.dart';

import 'app/modules/forget_password/forget_password_module.dart';
import 'app/modules/home/home_module.dart';
import 'app/modules/home_user/home_user_module.dart';
import 'app/modules/login/data/datasources/remote_datasource.dart';
import 'app/modules/login/data/datasources/remote/firebase/firebase_remote_datasource_imp.dart';
import 'app/modules/login/data/repositories/get_current_uid_repository_imp.dart';
import 'app/modules/login/data/repositories/is_sign_in_repository_imp.dart';
import 'app/modules/login/data/repositories/sign_in_repository_imp.dart';
import 'app/modules/login/data/repositories/sign_out_repository_imp.dart';
import 'app/modules/login/domain/usecases/get_current_uid/get_current_uid_usecase_imp.dart';
import 'app/modules/login/domain/usecases/is_sign_in/is_sign_in_usecase_imp.dart';
import 'app/modules/login/domain/usecases/sign_in/sign_in_usecase.dart';
import 'app/modules/login/domain/usecases/sign_in/sign_in_usecase_imp.dart';
import 'app/modules/login/domain/usecases/sign_out/sign_out_usecase_imp.dart';
import 'app/modules/login/login_module.dart';
import 'app/modules/login/presentation/cubit/sign_in_cubit.dart';
import 'app/modules/registration_info_user/registration_info_user_module.dart';
import 'app/modules/settings/settings_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        //firebase
        Bind<RemoteDataSource>((i) => FirebaseRemoteDataSourceImp()),

        //repository
        Bind<SignInRepository>((i) => SignInRepositoryImp(
            firebaseRemoteDataSource: i<FirebaseRemoteDataSourceImp>())),
        Bind<IsSignInRepository>((i) => IsSignInRepositoryImp(
            firebaseRemoteDataSource: i<FirebaseRemoteDataSourceImp>())),
        Bind<GetCurrentUIdRepository>((i) => GetCurrentUIdRepositoryImp(
            firebaseRemoteDataSource: i<FirebaseRemoteDataSourceImp>())),
        Bind<SignOutRepository>((i) => SignOutRepositoryImp(
            firebaseRemoteDataSource: i<FirebaseRemoteDataSourceImp>())),

        //usecase
        Bind(
          (i) => SignInUseCaseImp(signInRepository: i<SignInRepository>()),
        ),
        Bind.factory(
          (i) =>
              IsSignInUseCaseImp(isSignInRepository: i<IsSignInRepository>()),
        ),
        Bind(
          (i) => GetCurrentUIdUseCaseImp(
              getCurrentUIdRepository: i<GetCurrentUIdRepository>()),
        ),
        Bind(
          (i) => SignOutUseCaseImp(signOutRepository: i<SignOutRepository>()),
        ),

        //cubit
        Bind.singleton<SignInCubit>(
          (i) => SignInCubit(
            signInUseCase: i<SignInUseCase>(),
            isSignInUseCase: i<IsSignInUseCase>(),
            getCurrentUIdUseCase: i<GetCurrentUIdUseCase>(),
            signOutUseCase: i<SignOutUseCase>(),
          ),
        ),
        Bind.singleton<RegistrationInfoUserCubit>(
            (i) => RegistrationInfoUserCubit()),
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
        ),
        ModuleRoute(
          '/home_user',
          module: HomeUserModule(),
        )
      ];
}
