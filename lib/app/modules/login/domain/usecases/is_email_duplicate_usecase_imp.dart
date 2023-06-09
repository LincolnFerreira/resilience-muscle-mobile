import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../presentation/usecase/is_email_duplicate_usecase.dart';
import '../repositories/is_email_duplicate_repository.dart';

class IsEmailDuplicateUsecaseImp implements IsEmailDuplicateUsecase {
  final IsEmailDuplicateRepository repository;

  IsEmailDuplicateUsecaseImp({required this.repository});

  Future<Either<Failure, bool>> isEmailDuplicate(String email) async {
    try {
      final isDuplicate = await repository.isEmailDuplicate(email);
      return Right(isDuplicate);
    } catch (e) {
      return Left(Failure(message: "Failed to check email duplication"));
    }
  }
}
