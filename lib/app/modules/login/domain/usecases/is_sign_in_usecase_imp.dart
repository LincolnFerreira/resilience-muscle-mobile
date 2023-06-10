// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../presentation/usecase/is_sign_in_usecase.dart';
import '../repositories/is_sign_in_repository.dart';

class IsSignInUseCaseImp implements IsSignInUseCase {
  final IsSignInRepository isSignInRepository;

  IsSignInUseCaseImp({
    required this.isSignInRepository,
  });

  @override
  Future<Either<Failure, bool>> call() {
    return isSignInRepository.call();
  }
}
