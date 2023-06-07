import 'package:resilience_muscle/app/modules/settings/domain/repositories/upgrade_image_user_repository.dart';
import 'package:resilience_muscle/app/modules/settings/presentation/pages/settings_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/settings/presentation/cubit/settings_cubit.dart';
import 'package:resilience_muscle/app/modules/settings/presentation/usecases/upgrade_image_user_usecase.dart';

import 'data/repositories/upgrade_image_user_repository_imp.dart';
import 'domain/usecases/upgrade_image_user_usecase.dart';

class SettingsModule extends Module {
  @override
  List<Bind> get binds => [
        // repositories
        Bind<UpgradeImageUserRepository>((i) => UpgradeImageUserRepositoryImp(
              localDataSource: i(),
              remoteDataSource: i(),
            )),

        // usecases
        Bind<UpgradeImageUserUsecase>(
            (i) => UpgradeImageUserUsecaseImp(repository: i())),

        // cubits
        Bind.lazySingleton<SettingsCubit>((i) => SettingsCubit(
              userEntity: i(),
              imagePicker: i(),
              upgradeImageUserUsecase: i(),
            )),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SettingsPage()),
  ];
}
