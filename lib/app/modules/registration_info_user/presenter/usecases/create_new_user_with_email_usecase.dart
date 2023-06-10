import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class CreateNewUserWithEmailUsecase {
  Future<Either<Failure, bool>> call(String email, String password);
}
