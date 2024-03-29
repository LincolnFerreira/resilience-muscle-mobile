import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class IsSignInRepository {
  Future<Either<Failure, bool>> call();
}
