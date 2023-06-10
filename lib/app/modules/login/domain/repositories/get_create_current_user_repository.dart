import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class GetCreateCurrentUserRepository {
  Future<Either<Failure, void>> call(String uid);
}
