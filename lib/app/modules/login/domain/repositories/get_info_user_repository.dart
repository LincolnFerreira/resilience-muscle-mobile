import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../entities/user_info_entity.dart';

abstract class GetInfoUserRepository {
  Future<Either<Failure, UserInfoEntity>> call(String uid);
}
