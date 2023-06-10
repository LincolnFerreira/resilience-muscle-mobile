import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../../presentation/usecase/get_current_uid_usecase.dart';
import '../repositories/get_current_uid_repository.dart';

class GetCurrentUIdUseCaseImp implements GetCurrentUIdUseCase {
  final GetCurrentUIdRepository getCurrentUIdRepository;

  GetCurrentUIdUseCaseImp({required this.getCurrentUIdRepository});

  @override
  Future<Either<Failure, String>> getCurrentUId() async {
    return getCurrentUIdRepository();
  }
}
