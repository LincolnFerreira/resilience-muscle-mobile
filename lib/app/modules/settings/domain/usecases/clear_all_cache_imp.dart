// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:resilience_muscle/app/modules/settings/presentation/usecases/clear_all_cache_usecase.dart';

import '../../../../core/failure.dart';
import '../repositories/clear_all_cache_repository.dart';

class ClearAllCacheUsecaseImp implements ClearAllUsecaseCache {
  final ClearAllCacheRepository repository;

  ClearAllCacheUsecaseImp({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call() {
    return repository();
  }
}
