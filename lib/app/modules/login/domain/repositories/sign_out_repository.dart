import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class SignOutRepository {
  Future<Either<Failure, void>> call();
}
