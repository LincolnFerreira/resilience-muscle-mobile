import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../domain/repositories/is_sign_in_repository.dart';
import '../datasources/remote_datasource.dart';

class IsSignInRepositoryImp implements IsSignInRepository {
  final RemoteDataSource firebaseRemoteDataSource;

  IsSignInRepositoryImp({
    required this.firebaseRemoteDataSource,
  });

  @override
  Future<Either<Failure, bool>> call() {
    return firebaseRemoteDataSource.isSignIn();
  }
}
