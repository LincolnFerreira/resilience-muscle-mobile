import 'package:dartz/dartz.dart';
import 'package:resilience_muscle/app/core/failure.dart';
import 'package:resilience_muscle/app/modules/login/data/datasources/remote_datasource.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/domain/repositories/create_collections_info_user_repository.dart';

import '../../../login/domain/entities/user_info_entity.dart';

class CreateCollectionsInfoUserRepositoryImp
    implements CreateCollectionsInfoUserRepository {
  final RemoteDataSource remoteDataSource;

  CreateCollectionsInfoUserRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, bool>> call({
    required UserInfoEntity userInfoEntity,
    required String uid,
  }) {
    return remoteDataSource.createCollectionsInfoUser(
      userInfoEntity: userInfoEntity,
      uid: uid,
    );
  }
}
