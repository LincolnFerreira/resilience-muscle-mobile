import 'package:dartz/dartz.dart';
import 'package:resilience_muscle/app/modules/login/data/datasources/remote_datasource.dart';

import '../../../../core/failure.dart';
import '../../domain/repositories/is_info_user_collections_exists_repository.dart';

class IsInfoUserCollectionsExistsRepositoryImp
    implements IsInfoUserCollectionsExistsRepository {
  final RemoteDataSource remoteDataSource;

  IsInfoUserCollectionsExistsRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, bool>> call({required String uid}) async {
    return await remoteDataSource.isInfoUserCollectionsExists(uid);
  }
}
