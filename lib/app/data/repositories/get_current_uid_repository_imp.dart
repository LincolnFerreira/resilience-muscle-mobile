import 'package:resilience_muscle/app/domain/entities/user_entity.dart';
import 'package:resilience_muscle/app/domain/repositories/get_create_current_user_repository.dart';
import 'package:resilience_muscle/app/domain/repositories/get_current_uid_repository.dart';

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
