import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class IsInfoUserCollectionsExistsRepository {
  Future<Either<Failure, bool>> call({required String uid});
}
