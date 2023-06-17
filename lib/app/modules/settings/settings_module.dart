import 'package:image_picker/image_picker.dart';
import 'package:resilience_muscle/app/modules/login/data/datasources/remote_datasource.dart';
import 'package:resilience_muscle/app/modules/login/data/repositories/sign_out_repository_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/sign_out_repository.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/sign_out_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/sign_out_usecase.dart';
import 'package:resilience_muscle/app/modules/settings/domain/repositories/clear_all_cache_repository.dart';
import 'package:resilience_muscle/app/modules/settings/domain/repositories/upgrade_image_user_repository.dart';
import 'package:resilience_muscle/app/modules/settings/domain/usecases/clear_all_cache_imp.dart';
import 'package:resilience_muscle/app/modules/settings/presentation/atomic/pages/settings_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/settings/presentation/cubit/settings_cubit.dart';
import 'package:resilience_muscle/app/modules/settings/presentation/usecases/clear_all_cache_usecase.dart';
import 'package:resilience_muscle/app/modules/settings/presentation/usecases/upgrade_image_user_usecase.dart';
import 'package:resilience_muscle/app/shared/data/local_data.dart';
import 'package:resilience_muscle/app_cubit.dart';

import 'data/repositories/clear_all_cache_repository_imp.dart';
import 'data/repositories/upgrade_image_user_repository_imp.dart';
import 'domain/usecases/upgrade_image_user_usecase_imp.dart';

class SettingsModule extends Module {
  @override
  List<Bind> get binds => [
        ..._getRepositoryBinds(),
        ..._getUseCaseBinds(),
        ..._getCubitBinds(),
      ];
  List<Bind> _getRepositoryBinds() {
    return [
      Bind<UpgradeImageUserRepository>((i) => UpgradeImageUserRepositoryImp(
            remoteDataSource: i<RemoteDataSource>(),
          )),
      Bind<SignOutRepository>(
        (i) => SignOutRepositoryImp(
          remoteDataSource: i(),
        ),
      ),
      Bind<ClearAllCacheRepository>(
        (i) => ClearAllCacheRepositoryImp(
          localData: i<LocalData>(),
        ),
      ),
    ];
  }

  List<Bind> _getUseCaseBinds() {
    return [
      Bind<UpgradeImageUserUsecase>(
        (i) => UpgradeImageUserUsecaseImp(
          repository: i(),
        ),
      ),
      Bind<SignOutUsecase>(
        (i) => SignOutUseCaseImp(
          repository: i(),
        ),
      ),
      Bind<ClearAllUsecaseCache>(
        (i) => ClearAllCacheUsecaseImp(
          repository: i(),
        ),
      ),
    ];
  }

  List<Bind> _getCubitBinds() {
    return [
      Bind<SettingsCubit>((i) => SettingsCubit(
            imagePicker: i<ImagePicker>(),
            upgradeImageUserUsecase: i<UpgradeImageUserUsecase>(),
            signOutUsecase: i<SignOutUsecase>(),
            clearAllUsecaseCache: i<ClearAllUsecaseCache>(),
            appCubit: i<AppCubit>(),
          )),
    ];
  }

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SettingsPage()),
  ];
}
