import 'package:resilience_muscle/app/domain/entities/user_entity.dart';
import 'package:resilience_muscle/app/domain/repositories/get_create_current_user_repository.dart';

import '../datasources/firebase_remote_datasource.dart';

class GetCurrentUserRepository implements GetCreateCurrentUserRepository {
  final FirebaseRemoteDataSource firebaseRemoteDataSource;

  GetCurrentUserRepository({
    required this.firebaseRemoteDataSource,
  });
  @override
  Future<void> call(UserEntity user) {
    return firebaseRemoteDataSource.getCreateCurrentUser(user);
  }
}
