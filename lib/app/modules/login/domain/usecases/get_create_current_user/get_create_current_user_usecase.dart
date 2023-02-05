import '../../entities/user_entity.dart';

abstract class GetCreateCurrentUserUseCase {
  Future<void> getCreateCurrentUserUseCase(UserEntity user);
}
