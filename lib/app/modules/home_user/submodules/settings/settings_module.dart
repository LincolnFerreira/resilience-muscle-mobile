import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../app_cubit.dart';
import '../../../../shared/data/local_data.dart';
import '../../../login/data/datasources/remote_datasource.dart';
import '../../../login/data/repositories/sign_out_repository_imp.dart';
import '../../../login/domain/repositories/sign_out_repository.dart';
import '../../../login/domain/usecases/sign_out_usecase_imp.dart';
import '../../../login/presentation/usecase/sign_out_usecase.dart';
import 'data/repositories/clear_all_cache_repository_imp.dart';
import 'data/repositories/upgrade_image_user_repository_imp.dart';
import 'domain/repositories/clear_all_cache_repository.dart';
import 'domain/repositories/upgrade_image_user_repository.dart';
import 'domain/usecases/clear_all_cache_imp.dart';
import 'domain/usecases/upgrade_image_user_usecase_imp.dart';
import 'presentation/atomic/pages/settings_page.dart';
import 'presentation/cubit/settings_cubit.dart';
import 'presentation/usecases/clear_all_cache_usecase.dart';
import 'presentation/usecases/upgrade_image_user_usecase.dart';

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
