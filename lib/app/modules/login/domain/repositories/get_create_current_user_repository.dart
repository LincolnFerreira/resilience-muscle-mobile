import '../entities/user_entity.dart';

abstract class GetCreateCurrentUserRepository {
  Future<void> call(UserEntity user);
}
