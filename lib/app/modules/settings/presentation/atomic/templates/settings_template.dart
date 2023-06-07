import 'package:flutter/material.dart';

import '../../../../../../ui/box_text.dart';
import '../molecules/image_with_text_info_user_molecules.dart';
import '../molecules/sellect_with_icon.dart';
import '../organisms/card_sellect_with_icon.dart';

class SettingsTemplate extends StatelessWidget {
  final VoidCallback onTapEditProfile;
  final VoidCallback onTapLogout;
  final VoidCallback onTapChangeThemeMode;
  final VoidCallback onTapToggleNotifications;
  final VoidCallback onTapContact;
  final VoidCallback onTapSuggestions;
  final String imageUrl;
  final String nameUser;
  final String emailUser;
  final String versionPoweredAuthor;
  final VoidCallback onTapBackPage;
  final VoidCallback onTapImageProfile;

  const SettingsTemplate({
    super.key,
    required this.onTapEditProfile,
    required this.onTapLogout,
    required this.onTapChangeThemeMode,
    required this.onTapToggleNotifications,
    required this.onTapContact,
    required this.onTapSuggestions,
    required this.imageUrl,
    required this.nameUser,
    required this.emailUser,
    required this.versionPoweredAuthor,
    required this.onTapBackPage,
    required this.onTapImageProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: onTapBackPage,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: ImageWithTextInfoUser(
                  imageUrl: imageUrl,
                  nameUser: nameUser,
                  emailUser: emailUser,
                  onTapImageProfile: onTapImageProfile,
                ),
              ),
              CardSellectWithIcon(
                title: 'Conta',
                listOfSelectWithIconParams: [
                  SelectWithIconParams(
                    iconSellect: Icons.settings,
                    onTap: onTapEditProfile,
                    textSellect: 'Editar Perfil',
                  ),
                  SelectWithIconParams(
                    iconSellect: Icons.logout,
                    onTap: onTapLogout,
                    textSellect: 'Sair',
                  ),
                ],
              ),
              const Center(
                child: FractionallySizedBox(
                  widthFactor: 0.4, // Defina o fator de largura desejado aqui
                  child: Divider(
                    height: 40,
                  ),
                ),
              ),
              CardSellectWithIcon(
                title: 'Preferências',
                listOfSelectWithIconParams: [
                  SelectWithIconParams(
                    iconSellect: Icons.dark_mode,
                    onTap: onTapChangeThemeMode,
                    textSellect: 'Modo escuro',
                  ),
                  SelectWithIconParams(
                    iconSellect: Icons.notifications,
                    onTap: onTapToggleNotifications,
                    textSellect: 'Notificações',
                  ),
                ],
              ),
              const Center(
                child: FractionallySizedBox(
                  widthFactor: 0.4, // Defina o fator de largura desejado aqui
                  child: Divider(
                    height: 40,
                  ),
                ),
              ),
              CardSellectWithIcon(
                title: 'Suporte',
                listOfSelectWithIconParams: [
                  SelectWithIconParams(
                    iconSellect: Icons.sos,
                    onTap: onTapContact,
                    textSellect: 'Entre em contato',
                  ),
                  SelectWithIconParams(
                    iconSellect: Icons.support_agent_sharp,
                    onTap: onTapSuggestions,
                    textSellect: 'Sugestões',
                  ),
                ],
              ),
              Center(child: BoxText.caption(versionPoweredAuthor)),
            ],
          ),
        ),
      ),
    );
  }
}
