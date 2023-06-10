import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../presenter/usecases/create_new_user_with_email_usecase.dart';
import '../repositories/create_new_user_with_email_repository.dart';

class CreateNewUserWithEmailUsecaseImp
    implements CreateNewUserWithEmailUsecase {
  final CreateNewUserWithEmailRepository repository;

  CreateNewUserWithEmailUsecaseImp({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call(String email, String password) {
    return repository.createNewUserWithEmail(email: email, password: password);
  }
}
