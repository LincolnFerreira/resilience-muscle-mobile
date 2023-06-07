import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final UserEntity userEntity;
  SettingsCubit({
    required this.userEntity,
  }) : super(SettingsInitial());
}
