// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/is_info_user_collections_exists_repository.dart';

import '../../../../core/failure.dart';
import '../../presentation/usecase/is_info_user_collections_exists_usecase.dart';

class IsInfoUserCollectionsExistsUsecaseImp
    implements IsInfoUserCollectionsExistsUsecase {
  final IsInfoUserCollectionsExistsRepository repository;

  IsInfoUserCollectionsExistsUsecaseImp({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call({required String uid}) async {
    return await repository(uid: uid);
  }
}
