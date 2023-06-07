import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';

import '../usecases/upgrade_image_user_usecase.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final UserEntity userEntity;
  final ImagePicker imagePicker;
  final UpgradeImageUserUsecase upgradeImageUserUsecase;

  SettingsCubit({
    required this.imagePicker,
    required this.userEntity,
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
    } else {
      print("não escolheu");
    }
  }
}
