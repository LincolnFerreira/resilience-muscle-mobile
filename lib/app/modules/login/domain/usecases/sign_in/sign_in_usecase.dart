import '../../entities/user_entity.dart';

abstract class SignInUseCase {
  Future<void> call(UserEntity user);
}
