import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../domain/entities/user_entity.dart';

abstract class RemoteDataSource {
  Future<bool> isSignIn();
  Future<void> signUp(UserEntity user);
  Future<Either<Failure, UserEntity>> signIn(UserEntity user);
  Future<void> signOut();
  Future<String> getCurrentUId();
  Future<void> getCreateCurrentUser(String uid);
}
