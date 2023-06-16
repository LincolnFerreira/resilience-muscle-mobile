// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:resilience_muscle/app/modules/login/presentation/usecase/sign_out_usecase.dart';

import '../usecases/upgrade_image_user_usecase.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final ImagePicker imagePicker;
  final SignOutUsecase signOutUsecase;
  final UpgradeImageUserUsecase upgradeImageUserUsecase;

  SettingsCubit({
    required this.imagePicker,
    required this.signOutUsecase,
    required this.upgradeImageUserUsecase,
  }) : super(SettingsInitial());

  Future<XFile?> getImage() async {
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }

  void onTapImageProfile() async {
    final XFile? newImageProfile = await getImage();
    if (newImageProfile != null) {
      return;
    } else {}
  }

  void onTapSuggestions() {
    //TODO: fazer um "modal"
  }

  void onTapContact() {
    //uma nova página para contato
  }

  void onTapToggleNotifications() {
    //deixar ela como toogle
  }

  void onTapChangeThemeMode() {
    //deixar ela como toogle
  }

  Future<void> onTapLogout() async {
    try {
      // await clearCacheUsecase();
      await signOutUsecase();
    } catch (e) {}
  }

  onTapEditProfile() {}
}
