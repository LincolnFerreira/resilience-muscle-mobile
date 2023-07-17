import 'package:dartz/dartz.dart';

import '../../core/failure.dart';

abstract class LocalData {
  Future<Either<Failure, void>> clearAllBoxes();
  Future<Either<Failure, void>> openBoxes();
}
