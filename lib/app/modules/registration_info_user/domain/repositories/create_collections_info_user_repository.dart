import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../../login/domain/entities/user_info_entity.dart';

abstract class CreateCollectionsInfoUserRepository {
  Future<Either<Failure, bool>> call({
    required UserInfoEntity userInfoEntity,
    required String uid,
  });
}
