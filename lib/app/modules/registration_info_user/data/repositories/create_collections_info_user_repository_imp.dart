import 'package:dartz/dartz.dart';
import 'package:resilience_muscle/app/core/failure.dart';
import 'package:resilience_muscle/app/modules/login/data/datasources/remote_datasource.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/domain/repositories/create_collections_info_user_repository.dart';

class CreateCollectionsInfoUserRepositoryImp
    implements CreateCollectionsInfoUserRepository {
  final RemoteDataSource remoteDataSource;

  CreateCollectionsInfoUserRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, bool>> call(
      {required String name,
      required DateTime birthDate,
      required double height,
      required double weight,
      required String uid}) {
    return remoteDataSource.createCollectionsInfoUser(
      name: name,
      birthDate: birthDate,
      height: height,
      weight: weight,
      uid: uid,
    );
  }
}
