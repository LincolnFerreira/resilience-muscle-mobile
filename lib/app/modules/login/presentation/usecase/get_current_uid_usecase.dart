import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class GetCurrentUIdUseCase {
  Future<Either<Failure, String>> getCurrentUId();
}
