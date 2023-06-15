import 'package:hive/hive.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';

import '../../domain/repositories/save_current_user_repository.dart';

class SaveCurrentUserRepositoryImp implements SaveCurrentUserRepository {
  final Box<UserEntity> userEntityBox;

  SaveCurrentUserRepositoryImp({
    required this.userEntityBox,
  });

  @override
  Future<void> saveUser(UserEntity user) async {
    //TODO: verificar boas práticas e utilização de criptografica para uid
    UserEntity newUser = UserEntity(
      email: user.email,
      uid: user.uid,
    );

    userEntityBox.put('user', newUser);
  }
}
