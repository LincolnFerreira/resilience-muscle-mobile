import '../../domain/entities/user_entity.dart';

abstract class SaveCurrentUserUseCase {
  Future<void> call(UserEntity userEntity);
}
