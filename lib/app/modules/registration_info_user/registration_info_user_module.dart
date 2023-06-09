import 'package:resilience_muscle/app/modules/login/data/repositories/is_email_duplicate_repository_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/is_email_duplicate_repository.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/is_email_duplicate_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/is_email_duplicate_usecase.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/registration_info_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cubit/registration_info_user_cubit.dart';

class RegistrationInfoUserModule extends Module {
  @override
  final List<Bind> binds = [
    //repositories
    Bind<IsEmailDuplicateRepository>((i) => i<IsEmailDuplicateRepositoryImp>()),
    //usecases
    Bind<IsEmailDuplicateUsecase>((i) => i<IsEmailDuplicateUsecaseImp>()),

    //cubits
    Bind.singleton<RegistrationInfoUserCubit>(
      (i) => RegistrationInfoUserCubit(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const RegistrationInfoUserPage(),
    ),
  ];
}
