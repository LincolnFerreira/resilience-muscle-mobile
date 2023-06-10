// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:resilience_muscle/app/modules/login/data/datasources/remote/firebase/firebase_remote_datasource_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';

import '../../../../core/failure.dart';
import '../../domain/repositories/get_current_user_repository.dart';

class GetCurrentUserRepositoryImp implements GetCurrentUserRepository {
  final FirebaseRemoteDataSourceImp firebaseRemoteDataSourceImp;

  GetCurrentUserRepositoryImp({
    required this.firebaseRemoteDataSourceImp,
  });

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser(String uid) async {
    return await firebaseRemoteDataSourceImp.getCurrentUser(uid);
  }
}
