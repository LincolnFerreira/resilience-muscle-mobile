import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/settings/presentation/atomic/templates/settings_template.dart';

import '../cubit/settings_cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

final cubit = Modular.get<SettingsCubit>();

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      bloc: cubit,
      builder: (context, state) {
        return SettingsTemplate(
          onTapImageProfile: cubit.onTapImageProfile,
          onTapEditProfile: cubit.onTapEditProfile,
          onTapLogout: cubit.onTapLogout,
          onTapChangeThemeMode: cubit.onTapChangeThemeMode,
          onTapToggleNotifications: cubit.onTapToggleNotifications,
          onTapContact: cubit.onTapContact,
          onTapSuggestions: cubit.onTapSuggestions,
          imageUrl: 'cubit.userInfoEntity.image',
          nameUser: 'cubit.userInfoEntity.name!',
          emailUser: 'cubit.userEntity.email',
          versionPoweredAuthor: 'versionPoweredAuthor',
          onTapBackPage: () {
            Modular.to.pushNamed('/home_user/');
          },
        );
      },
    );
  }
}
