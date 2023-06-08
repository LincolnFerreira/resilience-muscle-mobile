import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/get_create_current_user_repository.dart';
import '../datasources/remote_datasource.dart';

// class GetCurrentUserRepository implements GetCreateCurrentUserRepository {
//   final RemoteDataSource firebaseRemoteDataSource;

//   GetCurrentUserRepository({
//     required this.firebaseRemoteDataSource,
//   });
//   @override
//   Future<void> call(UserEntity user) {
//     return firebaseRemoteDataSource.getCreateCurrentUser(user);
//   }
// }
