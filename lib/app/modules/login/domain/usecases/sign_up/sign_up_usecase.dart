import '../../entities/user_entity.dart';

abstract class SignUpUseCase {
  Future<void> call(UserEntity user);
}
