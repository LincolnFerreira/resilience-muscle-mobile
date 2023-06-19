import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/home_user/submodules/attendance/attendance_module.dart';
import 'package:resilience_muscle/app/modules/home_user/submodules/performance/performance_module.dart';
import 'package:resilience_muscle/app/modules/home_user/submodules/settings/settings_module.dart';
import 'package:resilience_muscle/app/modules/login/data/datasources/remote/firebase/firebase_remote_datasource_imp.dart';
import 'package:resilience_muscle/app_cubit.dart';

import '../login/data/repositories/get_current_user_repository_imp.dart';
import '../login/data/repositories/get_info_user_repository_imp.dart';
import '../login/domain/repositories/get_current_user_repository.dart';
import '../login/domain/repositories/get_info_user_repository.dart';
import '../login/domain/usecases/get_current_user_usecase_imp.dart';
import '../login/domain/usecases/get_info_user_usecase_imp.dart';
import '../login/presentation/usecase/get_current_user_usecase.dart';
import '../login/presentation/usecase/get_info_user_usecase.dart';
import 'cubit/home_user_cubit.dart';
import 'atomic/pages/home_user_page.dart';

class HomeUserModule extends Module {
  @override
  List<Bind> get binds => [
        ..._getRepositoryBinds(),
        ..._getUseCaseBinds(),
        ..._getCubitBinds(),
      ];

  List<Bind> _getRepositoryBinds() {
    return [
      Bind<GetCurrentUserRepository>(
        (i) => GetCurrentUserRepositoryImp(
          firebaseRemoteDataSourceImp: i<FirebaseRemoteDataSourceImp>(),
        ),
      ),
      Bind<GetInfoUserRepository>(
        (i) => GetInfoUserRepositoryImp(
          remoteDataSource: i<FirebaseRemoteDataSourceImp>(),
        ),
      ),
    ];
  }

  List<Bind> _getUseCaseBinds() {
    return [
      Bind<GetInfoUserUsecase>(
        (i) => GetInfoUserUsecaseImp(repository: i<GetInfoUserRepository>()),
      ),
      Bind<GetCurrentUserUsecase>(
        (i) =>
            GetCurrentUserUsecaseImp(repository: i<GetCurrentUserRepository>()),
      ),
    ];
  }

  List<Bind> _getCubitBinds() {
    return [
      Bind.singleton<HomeUserCubit>(
        (i) => HomeUserCubit(
          getCurrentUserUsecase: i<GetCurrentUserUsecase>(),
          boxUserEntityBox: i(),
          boxUserInfoEntity: i(),
          getInfoUserUsecase: i(),
          appCubit: Modular.get<AppCubit>(),
        ),
      ),
    ];
  }

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomeUserPage()),
    ModuleRoute('/performance', module: PerformanceModule()),
    ModuleRoute(
      '/settings',
      module: SettingsModule(),
      transition: TransitionType.defaultTransition,
      duration: const Duration(milliseconds: 300),
    ),
    ModuleRoute('/attendance', module: AttendanceModule()),
  ];
}
