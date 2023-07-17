import '../../presentation/usecase/save_current_usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/save_current_user_repository.dart';

class SaveCurrentUserUseCaseImp implements SaveCurrentUserUseCase {
  final SaveCurrentUserRepository repository;

  SaveCurrentUserUseCaseImp({required this.repository});

  @override
  Future<void> call(UserEntity userEntity) {
    return repository.saveUser(userEntity);
  }
}
