import '../../repositories/get_current_uid_repository.dart';
import 'get_current_uid_usecase.dart';

class GetCurrentUIdUseCaseImp implements GetCurrentUIdUseCase {
  final GetCurrentUIdRepository getCurrentUIdRepository;

  GetCurrentUIdUseCaseImp({required this.getCurrentUIdRepository});

  @override
  Future<String> getCurrentUId() async {
    return getCurrentUIdRepository();
  }
}
