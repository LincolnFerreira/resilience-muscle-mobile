import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/failure.dart';
import '../../presentation/usecases/upgrade_image_user_usecase.dart';
import '../repositories/upgrade_image_user_repository.dart';

class UpgradeImageUserUsecaseImp extends UpgradeImageUserUsecase {
  final UpgradeImageUserRepository repository;

  UpgradeImageUserUsecaseImp({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> upgradeImageProfile(XFile imageProfile) {
    return repository.upgradeImageProfile(imageProfile);
  }
}
