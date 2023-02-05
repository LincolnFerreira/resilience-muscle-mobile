import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/sign_up_repository.dart';
import '../datasources/firebase_remote_datasource.dart';

class SignUpRepositoryImp implements SignUpRepository {
  final FirebaseRemoteDataSource firebaseRemoteDataSource;

  SignUpRepositoryImp(this.firebaseRemoteDataSource);
  @override
  Future<void> call(UserEntity user) {
    return firebaseRemoteDataSource.signUp(user);
  }
}
