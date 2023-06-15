// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:resilience_muscle/app/modules/login/domain/entities/user_info_entity.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState(userInfo: UserInfoEntity()));

  void updateUserInfo(UserInfoEntity newUserInfoEntity) {
    emit(state.copyWith(userInfo: newUserInfoEntity));
  }
}
