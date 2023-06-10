import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';

abstract class CreateCollectionsInfoUserRepository {
  Future<Either<Failure, bool>> call({
    required String name,
    required DateTime birthDate,
    required double height,
    required double weight,
    required String uid,
  });
}
