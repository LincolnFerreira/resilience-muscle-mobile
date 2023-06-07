import 'package:flutter/material.dart';
import 'package:resilience_muscle/app/modules/settings/atomic/templates/settings_template.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const SettingsTemplate(
      onTapEditProfile: onTapEditProfile,
      onTapLogout: onTapLogout,
      onTapChangeThemeMode: onTapChangeThemeMode,
      onTapToggleNotifications: onTapToggleNotifications,
      onTapContact: onTapContact,
      onTapSuggestions: onTapSuggestions,
      imageUrl: imageUrl,
      nameUser: nameUser,
      emailUser: emailUser,
      versionPoweredAuthor: versionPoweredAuthor,
    );
  }
}
