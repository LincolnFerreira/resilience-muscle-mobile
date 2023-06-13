import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class IsInfoUserCollectionsExistsUsecase {
  Future<Either<Failure, bool>> call({required String uid});
}
