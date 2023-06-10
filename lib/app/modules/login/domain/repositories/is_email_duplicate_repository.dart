import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class IsEmailDuplicateRepository {
  Future<Either<Failure, bool>> isEmailDuplicate(String email);
}
