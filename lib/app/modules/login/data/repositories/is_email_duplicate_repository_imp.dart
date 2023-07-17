import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../domain/repositories/is_email_duplicate_repository.dart';
import '../datasources/remote_datasource.dart';

class IsEmailDuplicateRepositoryImp implements IsEmailDuplicateRepository {
  final RemoteDataSource remoteDataSource;

  IsEmailDuplicateRepositoryImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, bool>> isEmailDuplicate(String email) {
    return remoteDataSource.isEmailDuplicate(email);
  }
}
