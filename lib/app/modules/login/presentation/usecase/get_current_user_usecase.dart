import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../domain/entities/user_entity.dart';

abstract class GetCurrentUserUsecase {
  Future<Either<Failure, UserEntity>> call(String uid);
}
