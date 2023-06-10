import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../presentation/usecase/sign_in_usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/sign_in_repository.dart';

class SignInUseCaseImp implements SignInUseCase {
  final SignInRepository signInRepository;

  SignInUseCaseImp({
    required this.signInRepository,
  });

  @override
  Future<Either<Failure, UserEntity>> call(UserEntity user) async {
    return await signInRepository(user);
  }
}
