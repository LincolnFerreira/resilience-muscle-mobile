// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../repositories/is_sign_in_repository.dart';
import 'is_sign_in_usecase.dart';

class IsSignInUseCaseImp implements IsSignInUseCase {
  final IsSignInRepository isSignInRepository;

  IsSignInUseCaseImp({
    required this.isSignInRepository,
  });

  @override
  Future<bool> call() {
    return isSignInRepository.call();
  }
}
