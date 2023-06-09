import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class IsEmailDuplicateUsecase {
  Future<Either<Failure, bool>> isEmailDuplicate(String email);
}
