import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class SignOutUsecase {
  Future<Either<Failure, void>> call();
}
