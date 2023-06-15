import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resilience_muscle/app/modules/login/data/repositories/save_current_user_repository_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_info_entity.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/get_current_uid_repository.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/is_sign_in_repository.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/save_current_user_repository.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/sign_out_repository.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/get_current_uid_usecase.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/is_sign_in_usecase.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/save_current_usecase.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/sign_out_usecase.dart';
import 'package:resilience_muscle/app/modules/splash/splash_module.dart';
import 'package:resilience_muscle/app_cubit.dart';

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
import 'app_initializer.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        ..._getUtilBinds(),
        ..._getHiveBinds(),
        ..._getFirebaseBinds(),
        ..._getRepositoryBinds(),
        ..._getUseCaseBinds(),
        ..._getCubitBinds(),
      ];

  List<Bind> _getUtilBinds() {
    return [
      Bind.lazySingleton<ImagePicker>((i) => ImagePicker()),
    ];
  }

  List<Bind> _getHiveBinds() {
    return [
      Bind<Box<UserEntity>>((i) => Hive.box<UserEntity>(HiveBoxes.userBox)),
      Bind<Box<UserInfoEntity>>(
          (i) => Hive.box<UserInfoEntity>(HiveBoxes.infoUserBox)),
    ];
  }

  List<Bind> _getFirebaseBinds() {
    return [
      Bind<RemoteDataSource>((i) => FirebaseRemoteDataSourceImp()),
    ];
  }

  List<Bind> _getRepositoryBinds() {
    return [
      Bind<IsSignInRepository>((i) => IsSignInRepositoryImp(
            firebaseRemoteDataSource: i<FirebaseRemoteDataSourceImp>(),
          )),
      Bind<GetCurrentUIdRepository>((i) => GetCurrentUIdRepositoryImp(
            firebaseRemoteDataSource: i<FirebaseRemoteDataSourceImp>(),
          )),
      Bind<SignOutRepository>((i) => SignOutRepositoryImp(
            firebaseRemoteDataSource: i<FirebaseRemoteDataSourceImp>(),
          )),
      Bind<SaveCurrentUserRepository>((i) => SaveCurrentUserRepositoryImp(
            userEntityBox: i<Box<UserEntity>>(),
          )),
    ];
  }

  List<Bind> _getUseCaseBinds() {
    return [
      Bind<SaveCurrentUserUseCase>((i) => SaveCurrentUserUseCaseImp(
            repository: i<SaveCurrentUserRepository>(),
          )),
      Bind<IsSignInUseCase>((i) => IsSignInUseCaseImp(
            isSignInRepository: i<IsSignInRepository>(),
          )),
      Bind<GetCurrentUIdUseCase>((i) => GetCurrentUIdUseCaseImp(
            getCurrentUIdRepository: i<GetCurrentUIdRepository>(),
          )),
      Bind<SignOutUsecase>((i) => SignOutUseCaseImp(
            repository: i<SignOutRepository>(),
          )),
    ];
  }

  List<Bind> _getCubitBinds() {
    return [
      Bind<AppCubit>((i) => AppCubit()),
    ];
  }

  @override
  List<ModuleRoute> get routes => [
        ..._getModuleRoutes(),
      ];

  List<ModuleRoute> _getModuleRoutes() {
    return [
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
}
