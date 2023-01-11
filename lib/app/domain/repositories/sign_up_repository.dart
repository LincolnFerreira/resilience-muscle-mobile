import 'package:resilience_muscle/app/domain/entities/user_entity.dart';

abstract class SignUpRepository {
  Future<void> call(UserEntity user);
}
