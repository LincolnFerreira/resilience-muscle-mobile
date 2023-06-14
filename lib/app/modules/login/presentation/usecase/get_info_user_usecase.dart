import 'package:dartz/dartz.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_info_entity.dart';

import '../../../../core/failure.dart';

abstract class GetInfoUserUsecase {
  Future<Either<Failure, UserInfoEntity>> call(String uid);
}
