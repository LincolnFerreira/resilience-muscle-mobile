// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:resilience_muscle/app/domain/usecases/sign_out/sign_out_usecase.dart';

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
