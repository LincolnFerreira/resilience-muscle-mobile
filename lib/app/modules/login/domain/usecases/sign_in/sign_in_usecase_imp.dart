import 'package:dartz/dartz.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/sign_in/sign_in_usecase.dart';

import '../../../../../core/failure.dart';
import '../../entities/user_entity.dart';
import '../../repositories/sign_in_repository.dart';

class SignInUseCaseImp implements SignInUseCase {
  final SignInRepository signInRepository;

  SignInUseCaseImp({
    required this.signInRepository,
  });

  @override
  Future<Either<Failure, void>> call(UserEntity user) async {
    return signInRepository(user);
  }
}
