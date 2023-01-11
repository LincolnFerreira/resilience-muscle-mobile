import 'package:resilience_muscle/app/domain/entities/user_entity.dart';

abstract class GetCreateCurrentUserUseCase {
  Future<void> getCreateCurrentUserUseCase(UserEntity user);
}
