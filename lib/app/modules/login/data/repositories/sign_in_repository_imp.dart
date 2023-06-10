import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/sign_in_repository.dart';
import '../datasources/remote_datasource.dart';

class SignInRepositoryImp implements SignInRepository {
  final RemoteDataSource firebaseRemoteDataSource;

  SignInRepositoryImp({
    required this.firebaseRemoteDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> call(UserEntity user) async {
    return await firebaseRemoteDataSource.signIn(user);
  }
}
