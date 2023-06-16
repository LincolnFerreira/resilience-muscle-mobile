// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../domain/repositories/sign_out_repository.dart';
import '../datasources/remote_datasource.dart';

class SignOutRepositoryImp implements SignOutRepository {
  RemoteDataSource remoteDataSource;

  SignOutRepositoryImp({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, void>> call() {
    return remoteDataSource.signOut();
  }
}
