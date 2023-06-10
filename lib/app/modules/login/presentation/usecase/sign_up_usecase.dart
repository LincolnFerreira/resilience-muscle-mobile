import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../domain/entities/user_entity.dart';

abstract class SignUpUseCase {
  Future<Either<Failure, void>> call(UserEntity user);
}
