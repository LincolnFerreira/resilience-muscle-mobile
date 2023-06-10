import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class GetCurrentUIdRepository {
  Future<Either<Failure, String>> call();
}
