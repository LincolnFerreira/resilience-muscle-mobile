import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resilience_muscle/app/modules/login/data/datasources/remote_datasource.dart';
import 'package:resilience_muscle/app/modules/settings/domain/repositories/upgrade_image_user_repository.dart';

import '../../../../core/failure.dart';

class UpgradeImageUserRepositoryImp extends UpgradeImageUserRepository {
  final RemoteDataSource remoteDataSource;

  UpgradeImageUserRepositoryImp({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, void>> upgradeImageProfile(
      XFile imageUserProfile) async {
    return Left(Failure(
      message: 'Image profile already exists',
    ));
  }
}
