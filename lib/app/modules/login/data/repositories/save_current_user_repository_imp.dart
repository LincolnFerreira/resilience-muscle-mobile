import 'package:hive/hive.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';

import '../../domain/repositories/save_current_user_repository.dart';

class SaveCurrentUserRepositoryImp implements SaveCurrentUserRepository {
  @override
  Future<void> saveUser(UserEntity user) async {
    final Box userBox = await Hive.openBox('user');

    //TODO: verificar boas práticas e utilização de criptografica para uid
    UserEntity newUser = UserEntity(
      email: user.email,
      name: user.name,
      password: '',
      uid: user.uid,
    );

    userBox.put('user', newUser);
  }
}
