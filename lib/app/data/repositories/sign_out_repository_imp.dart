// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:resilience_muscle/app/data/datasources/firebase_remote_datasource.dart';

import '../../domain/repositories/sign_out_repository.dart';

class SignOutRepositoryImp implements SignOutRepository {
  FirebaseRemoteDataSource firebaseRemoteDataSource;

  SignOutRepositoryImp({
    required this.firebaseRemoteDataSource,
  });

  @override
  Future<void> call() {
    return firebaseRemoteDataSource.signOut();
  }
}
