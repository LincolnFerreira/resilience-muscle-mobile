import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../domain/repositories/get_current_uid_repository.dart';
import '../datasources/remote_datasource.dart';

class GetCurrentUIdRepositoryImp implements GetCurrentUIdRepository {
  final RemoteDataSource firebaseRemoteDataSource;

  GetCurrentUIdRepositoryImp({
    required this.firebaseRemoteDataSource,
  });

  @override
  Future<Either<Failure, String>> call() {
    return firebaseRemoteDataSource.getCurrentUId();
  }
}
