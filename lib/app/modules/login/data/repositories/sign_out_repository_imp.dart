// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../domain/repositories/sign_out_repository.dart';
import '../datasources/remote_datasource.dart';

class SignOutRepositoryImp implements SignOutRepository {
  RemoteDataSource firebaseRemoteDataSource;

  SignOutRepositoryImp({
    required this.firebaseRemoteDataSource,
  });

  @override
  Future<void> call() {
    return firebaseRemoteDataSource.signOut();
  }
}
