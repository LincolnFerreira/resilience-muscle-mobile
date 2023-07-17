// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:resilience_muscle/app/core/failure.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_info_entity.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/get_info_user_usecase.dart';

import '../repositories/get_info_user_repository.dart';

class GetInfoUserUsecaseImp implements GetInfoUserUsecase {
  final GetInfoUserRepository repository;

  GetInfoUserUsecaseImp({
    required this.repository,
  });

  @override
  Future<Either<Failure, UserInfoEntity>> call(String uid) {
    return repository(uid);
  }
}
