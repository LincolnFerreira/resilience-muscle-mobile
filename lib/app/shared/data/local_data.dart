import 'package:dartz/dartz.dart';
import 'package:resilience_muscle/app/core/failure.dart';

abstract class LocalData {
  Future<Either<Failure, void>> clearAllBoxes();
  Future<Either<Failure, void>> openBoxes();
}
