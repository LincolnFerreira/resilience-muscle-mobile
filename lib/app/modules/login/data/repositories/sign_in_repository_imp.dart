import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/sign_in_repository.dart';
import '../datasources/firebase_remote_datasource.dart';

class SignInRepositoryImp implements SignInRepository {
  final FirebaseRemoteDataSource firebaseRemoteDataSource;

  SignInRepositoryImp({
    required this.firebaseRemoteDataSource,
  });

  @override
  Future<void> call(UserEntity user) async {
    firebaseRemoteDataSource.signIn(user);
  }
}
