import '../../domain/repositories/is_sign_in_repository.dart';
import '../datasources/firebase_remote_datasource.dart';

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
