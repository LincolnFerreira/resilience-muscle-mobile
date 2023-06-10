import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class IsSignInUseCase {
  Future<Either<Failure, bool>> call();
}
