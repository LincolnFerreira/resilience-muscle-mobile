// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_info_entity.dart';

class AppState {
  final UserInfoEntity userInfo;
  final UserEntity userEntity;
  final bool isLogged;

  AppState({
    required this.userInfo,
    required this.userEntity,
    this.isLogged = false,
  });

  AppState copyWith({
    UserInfoEntity? userInfo,
    bool? isLogged,
    UserEntity? userEntity,
  }) {
    return AppState(
      userInfo: userInfo ?? this.userInfo,
      isLogged: isLogged ?? this.isLogged,
      userEntity: userEntity ?? this.userEntity,
    );
  }
}
