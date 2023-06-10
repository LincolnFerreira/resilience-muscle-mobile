import 'package:resilience_muscle/app/modules/login/data/datasources/remote/firebase/firebase_remote_datasource_imp.dart';
import 'package:resilience_muscle/app/modules/login/data/repositories/is_email_duplicate_repository_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/repositories/is_email_duplicate_repository.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/is_email_duplicate_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/is_email_duplicate_usecase.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/domain/usecases/create_new_user_with_email_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/cubits/registration_info_user_cubit.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/pages/registration_info_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/usecases/create_new_user_with_email_usecase.dart';

import 'data/repositories/create_new_user_with_email_repository_imp.dart';
import 'domain/repositories/create_new_user_with_email_repository.dart';

class RegistrationInfoUserModule extends Module {
  @override
  final List<Bind> binds = [
    //repositories
    Bind<IsEmailDuplicateRepository>((i) => IsEmailDuplicateRepositoryImp(
        remoteDataSource: i<FirebaseRemoteDataSourceImp>())),
    Bind<CreateNewUserWithEmailRepository>(
      (i) => CreateNewUserWithEmailRepositoryImp(
          remoteDataSource: i<FirebaseRemoteDataSourceImp>()),
    ),

    //usecases
    Bind<IsEmailDuplicateUsecase>((i) => IsEmailDuplicateUsecaseImp(
        repository: i<IsEmailDuplicateRepository>())),
    Bind<CreateNewUserWithEmailUsecase>((i) => CreateNewUserWithEmailUsecaseImp(
        repository: i<CreateNewUserWithEmailRepositoryImp>())),

    //cubits
    Bind.singleton<RegistrationInfoUserCubit>(
      (i) => RegistrationInfoUserCubit(
          isEmailDuplicateUsecase: i<IsEmailDuplicateUsecaseImp>(),
          createNewUserWithEmail: i<CreateNewUserWithEmailUsecase>()),
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
