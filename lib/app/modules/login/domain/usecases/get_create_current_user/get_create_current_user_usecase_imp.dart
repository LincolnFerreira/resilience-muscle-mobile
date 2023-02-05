import '../../entities/user_entity.dart';
import '../../repositories/get_create_current_user_repository.dart';
import 'get_create_current_user_usecase.dart';

class GetCreateCurrentUserUseCaseImp implements GetCreateCurrentUserUseCase {
  final GetCreateCurrentUserRepository getCreateCurrentUserRepository;

  GetCreateCurrentUserUseCaseImp(this.getCreateCurrentUserRepository);
  @override
  Future<void> getCreateCurrentUserUseCase(UserEntity user) async {
    return getCreateCurrentUserRepository(user);
  }
}
