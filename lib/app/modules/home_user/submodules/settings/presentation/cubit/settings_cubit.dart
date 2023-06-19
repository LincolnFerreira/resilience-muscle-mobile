// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import 'package:resilience_muscle/app/modules/login/presentation/usecase/sign_out_usecase.dart';
import 'package:resilience_muscle/app_cubit.dart';

import '../usecases/clear_all_cache_usecase.dart';
import '../usecases/upgrade_image_user_usecase.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final ImagePicker imagePicker;
  final SignOutUsecase signOutUsecase;
  final UpgradeImageUserUsecase upgradeImageUserUsecase;
  final ClearAllUsecaseCache clearAllUsecaseCache;
  final AppCubit appCubit;

  SettingsCubit({
    required this.imagePicker,
    required this.signOutUsecase,
    required this.upgradeImageUserUsecase,
    required this.clearAllUsecaseCache,
    required this.appCubit,
  }) : super(SettingsInitial());

  Logger logger = Logger();
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
      final res = await signOutUsecase();
      res.fold((failure) {
        // Tratamento de erro, se necessário
      }, (signOut) async {
        logger.i('deslogando...');
        emit(const SettingsSuccess(logout: true));
        await appCubit.clearCaches();
      });
    } catch (e) {
      // Tratamento de exceção, se necessário
    }
  }

  onTapEditProfile() {}
}
