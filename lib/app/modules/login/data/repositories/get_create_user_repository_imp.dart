import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../domain/repositories/get_create_current_user_repository.dart';
import '../datasources/remote_datasource.dart';

class GetCurrentUserRepository implements GetCreateCurrentUserRepository {
  final RemoteDataSource firebaseRemoteDataSource;

  GetCurrentUserRepository({
    required this.firebaseRemoteDataSource,
  });
  @override
  Future<Either<Failure, void>> call(String uid) async {
    return await firebaseRemoteDataSource.getCurrentUser(uid);
  }
}
