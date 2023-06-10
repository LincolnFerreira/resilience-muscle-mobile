import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/sign_up_repository.dart';
import '../datasources/remote_datasource.dart';

class SignUpRepositoryImp implements SignUpRepository {
  final RemoteDataSource firebaseRemoteDataSource;

  SignUpRepositoryImp(this.firebaseRemoteDataSource);
  @override
  Future<Either<Failure, void>> call(UserEntity user) {
    return firebaseRemoteDataSource.signUp(user);
  }
}
