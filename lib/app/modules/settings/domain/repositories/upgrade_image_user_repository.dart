import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/failure.dart';

abstract class UpgradeImageUserRepository {
  Future<Either<Failure, void>> upgradeImageProfile(XFile imageUserProfile);
}
