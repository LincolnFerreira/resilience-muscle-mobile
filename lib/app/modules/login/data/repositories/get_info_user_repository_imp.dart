// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import 'package:resilience_muscle/app/core/failure.dart';
import 'package:resilience_muscle/app/modules/login/data/datasources/remote_datasource.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_info_entity.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/get_info_user_repository.dart';

class GetInfoUserRepositoryImp implements GetInfoUserRepository {
  final RemoteDataSource remoteDataSource;

  GetInfoUserRepositoryImp({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, UserInfoEntity>> call(String uid) {
    return remoteDataSource.getInfoUser(uid);
  }
}
