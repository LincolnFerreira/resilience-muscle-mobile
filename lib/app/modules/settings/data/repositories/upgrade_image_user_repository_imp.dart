import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resilience_muscle/app/modules/login/data/datasources/remote/firebase/firebase_remote_datasource_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_info_entity.dart';
import 'package:resilience_muscle/app/modules/settings/domain/repositories/upgrade_image_user_repository.dart';

import '../../../../core/failure.dart';

class UpgradeImageUserRepositoryImp extends UpgradeImageUserRepository {
  final Box<UserInfoEntity> localDataSource;
  final FirebaseRemoteDataSourceImp remoteDataSource;

  UpgradeImageUserRepositoryImp({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, void>> upgradeImageProfile(
      XFile imageUserProfile) async {
    if (localDataSource.get('infoUser')?.image == null) {
      localDataSource.put('image',
          localDataSource.get('infoUser')!.copyWith(image: imageUserProfile));
      return const Right(null); // Image profile upgraded successfully
    } else {
      return Left(Failure(
        message: 'Image profile already exists',
      )); // Image profile already exists
    }
  }
}
