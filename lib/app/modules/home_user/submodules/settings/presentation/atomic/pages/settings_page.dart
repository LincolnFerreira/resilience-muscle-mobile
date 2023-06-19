import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/ui/resources/assets.dart';

import '../../cubit/settings_cubit.dart';
import '../templates/settings_template.dart';

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
      listener: (context, state) {
        if (state is SettingsSuccess && state.logout == true) {
          Modular.to.navigate('/login/');
        }
      },
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
          imageUrl: cubit.userInfoEntity.image == '' ||
                  cubit.userInfoEntity.image == null
              ? AssetsCollection.menCartoonImage()
              : cubit.userInfoEntity.image,
          nameUser: cubit.userInfoEntity.name ?? '',
          emailUser: cubit.userEntity.email,
          versionPoweredAuthor: 'versionPoweredAuthor',
          onTapBackPage: () {
            Modular.to.pushNamed('/home_user/');
          },
        );
      },
    );
  }
}
