// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/save_user/save_current_usecase.dart';

import '../../repositories/save_current_user_repository.dart';

class SaveCurrentUserUseCaseImp implements SaveCurrentUserUseCase {
  final SaveCurrentUserRepository repository;

  SaveCurrentUserUseCaseImp({
    required this.repository,
  });

  @override
  Future<void> call(UserEntity userEntity) {
    return repository.saveUser(userEntity);
  }
}
