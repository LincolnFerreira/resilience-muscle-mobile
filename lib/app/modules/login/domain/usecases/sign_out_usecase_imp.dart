import 'package:dartz/dartz.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/sign_out_usecase.dart';

import '../../../../core/failure.dart';
import '../repositories/sign_out_repository.dart';

class SignOutUseCaseImp implements SignOutUsecase {
  final SignOutRepository repository;

  SignOutUseCaseImp({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call() {
    return repository();
  }
}
