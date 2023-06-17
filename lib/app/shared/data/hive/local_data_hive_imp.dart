import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';
import 'package:resilience_muscle/app/shared/data/local_data.dart';

import '../../../../app_initializer.dart';
import '../../../core/failure.dart';
import '../../../modules/login/domain/entities/user_info_entity.dart';

class LocalDataHiveImp implements LocalData {
  final Box<UserEntity> boxUserEntity;
  final Box<UserInfoEntity> boxUserInfoEntity;

  LocalDataHiveImp({
    required this.boxUserEntity,
    required this.boxUserInfoEntity,
  });
  @override
  Future<Either<Failure, void>> openBoxes() async {
    try {
      await openBoxes();
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: 'Não foi possivel abrir as boxes'));
    }
  }

  @override
  Future<Either<Failure, void>> clearAllBoxes() async {
    try {
      clearAllData();
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: 'Erro ao limpar as boxes'));
    }
  }

  void clearAllData() async {}
}
