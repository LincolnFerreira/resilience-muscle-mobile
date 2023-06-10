import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/save_current_user_repository.dart';

import '../../presentation/usecase/save_current_usecase.dart';

class SaveCurrentUserUseCaseImp implements SaveCurrentUserUseCase {
  final SaveCurrentUserRepository repository;

  SaveCurrentUserUseCaseImp({required this.repository});

  @override
  Future<void> call(UserEntity userEntity) {
    return repository.saveUser(userEntity);
  }
}
