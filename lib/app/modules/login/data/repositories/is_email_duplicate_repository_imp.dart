import 'package:resilience_muscle/app/modules/login/data/datasources/remote_datasource.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/is_email_duplicate_repository.dart';

class IsEmailDuplicateRepositoryImp implements IsEmailDuplicateRepository {
  final RemoteDataSource remoteDataSource;

  IsEmailDuplicateRepositoryImp({required this.remoteDataSource});
  Future<bool> isEmailDuplicate(String email) {
    return remoteDataSource.isEmailDuplicate(email);
  }
}
