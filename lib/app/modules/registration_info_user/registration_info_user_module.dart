import 'package:resilience_muscle/app/modules/login/data/datasources/remote/firebase/firebase_remote_datasource_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/is_email_duplicate_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/cubits/registration_info_user_cubit.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/pages/registration_info_user_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/usecases/create_collections_info_user_usecase.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/usecases/create_new_user_with_email_usecase.dart';

import 'data/repositories/create_collections_info_user_repository_imp.dart';
import 'domain/repositories/create_collections_info_user_repository.dart';
import 'domain/usecases/create_collections_info_user_usecase_imp.dart';

class RegistrationInfoUserModule extends Module {
  @override
  final List<Bind> binds = [
    //repositories

    Bind<CreateCollectionsInfoUserRepository>(
      (i) => CreateCollectionsInfoUserRepositoryImp(
          remoteDataSource: i<FirebaseRemoteDataSourceImp>()),
    ),

    //usecases

    Bind<CreateCollectionsInfoUserUsecase>(
      (i) => CreateCollectionsInfoUserUsecaseImp(
          repository: i<CreateCollectionsInfoUserRepositoryImp>()),
    ),

    //cubits
    Bind.singleton<RegistrationInfoUserCubit>(
      (i) => RegistrationInfoUserCubit(
        isEmailDuplicateUsecase: i<IsEmailDuplicateUsecaseImp>(),
        createNewUserWithEmail: i<CreateNewUserWithEmailUsecase>(),
        createCollectionsInfoUserUsecase: i<CreateCollectionsInfoUserUsecase>(),
      ),
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
