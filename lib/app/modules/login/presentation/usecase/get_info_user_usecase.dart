import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../domain/entities/user_info_entity.dart';

abstract class GetInfoUserUsecase {
  Future<Either<Failure, UserInfoEntity>> call(String uid);
}
