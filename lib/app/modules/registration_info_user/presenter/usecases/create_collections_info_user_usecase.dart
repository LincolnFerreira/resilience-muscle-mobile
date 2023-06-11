import 'package:dartz/dartz.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_info_entity.dart';

import '../../../../core/failure.dart';

abstract class CreateCollectionsInfoUserUsecase {
  Future<Either<Failure, bool>> call({
    required UserInfoEntity userInfoEntity,
    required String uid,
  });
}
