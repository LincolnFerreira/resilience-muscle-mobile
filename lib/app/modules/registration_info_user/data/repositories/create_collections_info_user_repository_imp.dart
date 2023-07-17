import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../../login/data/datasources/remote_datasource.dart';
import '../../../login/domain/entities/user_info_entity.dart';
import '../../domain/repositories/create_collections_info_user_repository.dart';

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
