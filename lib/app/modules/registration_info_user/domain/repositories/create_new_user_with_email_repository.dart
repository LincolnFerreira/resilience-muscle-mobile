import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class CreateNewUserWithEmailRepository {
  Future<Either<Failure, bool>> createNewUserWithEmail(
      {required String email, required String password});
}
