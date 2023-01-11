// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:resilience_muscle/app/data/datasources/firebase_remote_datasource.dart';
import 'package:resilience_muscle/app/domain/entities/user_entity.dart';

import '../../domain/repositories/sign_in_repository.dart';

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
