import '../entities/user_entity.dart';

abstract class SignInRepository {
  Future<void> call(UserEntity user);
}
