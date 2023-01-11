import 'package:resilience_muscle/app/data/datasources/firebase_remote_datasource.dart';
import 'package:resilience_muscle/app/domain/entities/user_entity.dart';
import 'package:resilience_muscle/app/domain/repositories/sign_up_repository.dart';

class SignUpRepositoryImp implements SignUpRepository {
  final FirebaseRemoteDataSource firebaseRemoteDataSource;

  SignUpRepositoryImp(this.firebaseRemoteDataSource);
  @override
  Future<void> call(UserEntity user) {
    return firebaseRemoteDataSource.signUp(user);
  }
}
