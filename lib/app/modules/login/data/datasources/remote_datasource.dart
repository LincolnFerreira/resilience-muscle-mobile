import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../domain/entities/user_entity.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, bool>> isSignIn();
  Future<Either<Failure, void>> signUp(UserEntity user);
  Future<Either<Failure, UserEntity>> signIn(UserEntity user);
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, String>> getCurrentUId();
  Future<Either<Failure, UserEntity>> getCurrentUser(String uid);
  Future<Either<Failure, bool>> isEmailDuplicate(String email);
  Future<Either<Failure, bool>> createNewUserWithEmail(
      {required String email, required String password});
  Future<Either<Failure, bool>> createCollectionsInfoUser({
    required String name,
    required DateTime birthDate,
    required double height,
    required double weight,
    required String uid,
  });
}
