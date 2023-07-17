import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/failure.dart';
import '../../../../../login/data/datasources/remote_datasource.dart';
import '../../domain/repositories/upgrade_image_user_repository.dart';

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
