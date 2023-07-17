import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../presentation/usecase/sign_out_usecase.dart';
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
