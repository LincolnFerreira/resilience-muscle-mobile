import '../entities/user_entity.dart';

abstract class SaveCurrentUserRepository {
  Future<void> saveUser(UserEntity user);
}
