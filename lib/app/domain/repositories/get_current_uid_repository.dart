import 'package:resilience_muscle/app/domain/entities/user_entity.dart';

abstract class GetCurrentUIdRepository {
  Future<String> call();
}
