import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class ClearAllUsecaseCache {
  Future<Either<Failure, void>> call();
}
