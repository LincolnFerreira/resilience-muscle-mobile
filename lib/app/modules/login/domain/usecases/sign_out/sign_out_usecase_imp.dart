import 'package:resilience_muscle/app/modules/login/domain/usecases/sign_out/sign_out_usecase.dart';

import '../../repositories/sign_out_repository.dart';

class SignOutUseCaseImp implements SignOutUseCase {
  final SignOutRepository signOutRepository;

  SignOutUseCaseImp({
    required this.signOutRepository,
  });

  @override
  Future<void> call() {
    return signOutRepository.call();
  }
}
