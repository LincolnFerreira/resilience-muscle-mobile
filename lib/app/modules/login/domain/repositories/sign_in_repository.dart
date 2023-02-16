import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../entities/user_entity.dart';

abstract class SignInRepository {
  Future<Either<Failure, void>> call(UserEntity user);
}
