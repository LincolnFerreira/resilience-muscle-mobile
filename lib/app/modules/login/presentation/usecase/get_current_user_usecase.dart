import 'package:dartz/dartz.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';

import '../../../../core/failure.dart';

abstract class GetCurrentUserUsecase {
  Future<Either<Failure, UserEntity>> call(String uid);
}
