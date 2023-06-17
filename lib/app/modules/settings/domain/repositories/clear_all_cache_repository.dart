import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class ClearAllCacheRepository {
  Future<Either<Failure, void>> call();
}
