import 'package:resilience_muscle/app/modules/login/domain/usecases/sign_up/sign_up_usecase.dart';

import '../../entities/user_entity.dart';
import '../../repositories/sign_up_repository.dart';

class SignUpUseCaseImp implements SignUpUseCase {
  final SignUpRepository signUpRepository;

  SignUpUseCaseImp(this.signUpRepository);
  @override
  Future<void> call(UserEntity user) {
    return signUpRepository(user);
  }
}
