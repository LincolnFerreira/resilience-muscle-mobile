import 'package:resilience_muscle/app/domain/entities/user_entity.dart';
import 'package:resilience_muscle/app/domain/usecases/sign_up/sign_up_usecase.dart';

import '../../repositories/sign_up_repository.dart';

class SignUpUseCaseImp implements SignUpUseCase {
  final SignUpRepository signUpRepository;

  SignUpUseCaseImp(this.signUpRepository);
  @override
  Future<void> call(UserEntity user) {
    return signUpRepository(user);
  }
}
