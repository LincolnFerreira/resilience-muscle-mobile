import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../presentation/usecase/sign_up_usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/sign_up_repository.dart';

class SignUpUseCaseImp implements SignUpUseCase {
  final SignUpRepository signUpRepository;

  SignUpUseCaseImp(this.signUpRepository);
  @override
  Future<Either<Failure, void>> call(UserEntity user) {
    return signUpRepository(user);
  }
}
