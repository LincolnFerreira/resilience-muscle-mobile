import 'package:dartz/dartz.dart';
import 'package:resilience_muscle/app/core/failure.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/domain/repositories/create_collections_info_user_repository.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/usecases/create_collections_info_user_usecase.dart';

class CreateCollectionsInfoUserUsecaseImp
    implements CreateCollectionsInfoUserUsecase {
  final CreateCollectionsInfoUserRepository repository;

  CreateCollectionsInfoUserUsecaseImp({required this.repository});

  @override
  Future<Either<Failure, bool>> call(
      {required String name,
      required DateTime birthDate,
      required double height,
      required double weight,
      required String uid}) {
    return repository(
        name: name,
        birthDate: birthDate,
        height: height,
        weight: weight,
        uid: uid);
  }
}
