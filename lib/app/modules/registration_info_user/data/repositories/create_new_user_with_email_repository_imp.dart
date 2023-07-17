import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../../login/data/datasources/remote_datasource.dart';
import '../../domain/repositories/create_new_user_with_email_repository.dart';

class CreateNewUserWithEmailRepositoryImp
    implements CreateNewUserWithEmailRepository {
  final RemoteDataSource remoteDataSource;

  CreateNewUserWithEmailRepositoryImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, bool>> createNewUserWithEmail({
    required String email,
    required String password,
  }) {
    return remoteDataSource.createNewUserWithEmail(
        email: email, password: password);
  }
}
