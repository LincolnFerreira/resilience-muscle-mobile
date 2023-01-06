// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:resilience_muscle/app/domain/entities/user_entity.dart';
import 'package:resilience_muscle/app/domain/repositories/sign_in_repository.dart';
import 'package:resilience_muscle/app/domain/usecases/sign_in/sign_in_usecase.dart';

class SignInUseCaseImp implements SignInUseCase {
  final SignInRepository signInRepository;

  SignInUseCaseImp(this.signInRepository);

  @override
  Future<void> call(String email, String password) async {
    print('usecase');
    signInRepository.signIn(email, password);
  }
}
