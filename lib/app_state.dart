import 'package:resilience_muscle/app/modules/login/domain/entities/user_info_entity.dart';

class AppState {
  final UserInfoEntity userInfo;

  AppState({
    required this.userInfo,
  });

  AppState copyWith({UserInfoEntity? userInfo}) {
    return AppState(
      userInfo: userInfo ?? this.userInfo,
    );
  }
}
