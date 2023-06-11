import 'package:dartz/dartz.dart';
import 'package:resilience_muscle/app/core/failure.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_info_entity.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/domain/repositories/create_collections_info_user_repository.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/usecases/create_collections_info_user_usecase.dart';

class CreateCollectionsInfoUserUsecaseImp
    implements CreateCollectionsInfoUserUsecase {
  final CreateCollectionsInfoUserRepository repository;

  CreateCollectionsInfoUserUsecaseImp({required this.repository});

  @override
  Future<Either<Failure, bool>> call({
    required UserInfoEntity userInfoEntity,
    required String uid,
  }) {
    return repository(
      uid: uid,
      userInfoEntity: userInfoEntity,
    );
  }
}
