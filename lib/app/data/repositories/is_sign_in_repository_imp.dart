// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:resilience_muscle/app/data/datasources/firebase_remote_datasource.dart';
import 'package:resilience_muscle/app/domain/repositories/is_sign_in_repository.dart';

class IsSignInRepositoryImp implements IsSignInRepository {
  final FirebaseRemoteDataSource firebaseRemoteDataSource;

  IsSignInRepositoryImp({
    required this.firebaseRemoteDataSource,
  });

  @override
  Future<bool> call() {
    return firebaseRemoteDataSource.isSignIn();
  }
}
