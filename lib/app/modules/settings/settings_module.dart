import 'package:resilience_muscle/app/modules/settings/cubit/settings_cubit.dart';
import 'package:resilience_muscle/app/modules/settings/settings_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<SettingsCubit>((i) => SettingsCubit(userEntity: i())),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SettingsPage()),
  ];
}
