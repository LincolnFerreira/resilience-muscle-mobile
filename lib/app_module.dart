import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resilience_muscle/app/modules/login/data/repositories/save_current_user_repository_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/get_current_uid_repository.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/is_sign_in_repository.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/save_current_user_repository.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/sign_out_repository.dart';
import 'package:resilience_muscle/app/modules/splash/splash_module.dart';

import 'app/modules/forget_password/forget_password_module.dart';
import 'app/modules/home_user/home_user_module.dart';
import 'app/modules/login/data/datasources/remote_datasource.dart';
import 'app/modules/login/data/datasources/remote/firebase/firebase_remote_datasource_imp.dart';
import 'app/modules/login/data/repositories/get_current_uid_repository_imp.dart';
import 'app/modules/login/data/repositories/is_sign_in_repository_imp.dart';
import 'app/modules/login/data/repositories/sign_out_repository_imp.dart';
import 'app/modules/login/domain/usecases/get_current_uid_usecase_imp.dart';
import 'app/modules/login/domain/usecases/is_sign_in_usecase_imp.dart';
import 'app/modules/login/domain/usecases/save_current_usecase_imp.dart';
import 'app/modules/login/domain/usecases/sign_out_usecase_imp.dart';
import 'app/modules/login/login_module.dart';
import 'app/modules/registration_info_user/registration_info_user_module.dart';
import 'app/modules/settings/settings_module.dart';
import 'main.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // util
        Bind.lazySingleton<ImagePicker>((i) => ImagePicker()),

        //entity
        Bind.lazySingleton<UserEntity>((i) => UserEntity()),
        Bind((i) => Hive.box<UserEntity>(HiveBoxes.userBox)),

        //firebase
        Bind<RemoteDataSource>(
          (i) => FirebaseRemoteDataSourceImp(),
        ),

        //repository

        Bind<IsSignInRepository>(
          (i) => IsSignInRepositoryImp(
              firebaseRemoteDataSource: i<FirebaseRemoteDataSourceImp>()),
        ),
        Bind<GetCurrentUIdRepository>(
          (i) => GetCurrentUIdRepositoryImp(
              firebaseRemoteDataSource: i<FirebaseRemoteDataSourceImp>()),
        ),
        Bind<SignOutRepository>(
          (i) => SignOutRepositoryImp(
              firebaseRemoteDataSource: i<FirebaseRemoteDataSourceImp>()),
        ),
        Bind<SaveCurrentUserRepository>(
          (i) =>
              SaveCurrentUserRepositoryImp(userEntityBox: i<Box<UserEntity>>()),
        ),

        //usecase

        Bind(
          (i) => SaveCurrentUserUseCaseImp(
              repository: i<SaveCurrentUserRepository>()),
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
          (i) => SignOutUseCaseImp(repository: i<SignOutRepository>()),
        ),

        //cubit
      ];

  @override
  List<ModuleRoute> get routes => [
        ModuleRoute(
          '/',
          module: SplashModule(),
          transition: TransitionType.defaultTransition,
          duration: const Duration(milliseconds: 300),
        ),
        ModuleRoute(
          '/login',
          module: LoginModule(),
          transition: TransitionType.defaultTransition,
          duration: const Duration(milliseconds: 300),
        ),
        ModuleRoute(
          '/home_user',
          module: HomeUserModule(),
          transition: TransitionType.defaultTransition,
          duration: const Duration(milliseconds: 300),
        ),
        ModuleRoute(
          '/forget_password',
          module: ForgetPasswordModule(),
          transition: TransitionType.defaultTransition,
          duration: const Duration(milliseconds: 300),
        ),
        ModuleRoute(
          '/settings',
          module: SettingsModule(),
          transition: TransitionType.defaultTransition,
          duration: const Duration(milliseconds: 300),
        ),
        ModuleRoute(
          '/registration_info_user',
          module: RegistrationInfoUserModule(),
          transition: TransitionType.defaultTransition,
          duration: const Duration(milliseconds: 300),
        ),
        ModuleRoute(
          '/home_user',
          module: HomeUserModule(),
          transition: TransitionType.defaultTransition,
          duration: const Duration(milliseconds: 300),
        )
      ];
}
