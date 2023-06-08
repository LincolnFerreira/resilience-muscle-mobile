// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';

import '../../../../core/failure.dart';
import '../../presentation/usecase/get_current_user_usecase.dart';
import '../repositories/get_current_user_repository.dart';

class GetCurrentUserUsecaseImp implements GetCurrentUserUsecase {
  final GetCurrentUserRepository repository;

  GetCurrentUserUsecaseImp({
    required this.repository,
  });

  @override
  Future<Either<Failure, UserEntity>> call(String uid) {
    return repository.getCurrentUser(uid);
  }
}
