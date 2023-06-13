import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';

class UserCubit extends Cubit<UserEntity> {
  UserCubit() : super(UserEntity());

  void updateUser(UserEntity user) {
    emit(user);
  }
}
