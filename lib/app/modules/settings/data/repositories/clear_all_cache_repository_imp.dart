// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:resilience_muscle/app/modules/settings/domain/repositories/clear_all_cache_repository.dart';

import 'package:resilience_muscle/app/shared/data/local_data.dart';

import '../../../../core/failure.dart';

class ClearAllCacheRepositoryImp implements ClearAllCacheRepository {
  final LocalData localData;

  ClearAllCacheRepositoryImp({
    required this.localData,
  });
  @override
  Future<Either<Failure, void>> call() {
    return localData.clearAllBoxes();
  }
}
