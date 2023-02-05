import '../../domain/repositories/get_current_uid_repository.dart';
import '../datasources/firebase_remote_datasource.dart';

class GetCurrentUIdRepositoryImp implements GetCurrentUIdRepository {
  final FirebaseRemoteDataSource firebaseRemoteDataSource;

  GetCurrentUIdRepositoryImp({
    required this.firebaseRemoteDataSource,
  });

  @override
  Future<String> call() {
    return firebaseRemoteDataSource.getCurrentUId();
  }
}
