import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../entities/user_entity.dart';

abstract class GetCurrentUserRepository {
  Future<Either<Failure, UserEntity>> getCurrentUser(String uid);
}
