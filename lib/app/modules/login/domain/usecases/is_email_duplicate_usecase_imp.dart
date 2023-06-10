import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../presentation/usecase/is_email_duplicate_usecase.dart';
import '../repositories/is_email_duplicate_repository.dart';

class IsEmailDuplicateUsecaseImp implements IsEmailDuplicateUsecase {
  final IsEmailDuplicateRepository repository;

  IsEmailDuplicateUsecaseImp({required this.repository});

  @override
  Future<Either<Failure, bool>> isEmailDuplicate(String email) async {
    return await repository.isEmailDuplicate(email);
  }
}
