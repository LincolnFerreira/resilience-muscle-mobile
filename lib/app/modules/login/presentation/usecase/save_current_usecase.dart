import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';

abstract class SaveCurrentUserUseCase {
  Future<void> call(UserEntity userEntity);
}
