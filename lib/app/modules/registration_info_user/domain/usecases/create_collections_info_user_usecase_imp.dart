import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../../login/domain/entities/user_info_entity.dart';
import '../../presenter/usecases/create_collections_info_user_usecase.dart';
import '../repositories/create_collections_info_user_repository.dart';

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
