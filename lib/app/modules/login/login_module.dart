import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/get_current_user_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/login/presentation/cubits/sign_in_cubit.dart';
import 'package:resilience_muscle/app/modules/login/presentation/cubits/sign_up_cubit.dart';
import 'package:resilience_muscle/app/modules/login/presentation/atomic/pages/sign_in_page.dart';
import 'package:resilience_muscle/app/modules/login/presentation/atomic/pages/sign_up_page.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/get_current_user_usecase.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/is_email_duplicate_usecase.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/is_info_user_collections_exists_usecase.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/is_sign_in_usecase.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/sign_in_usecase.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/usecases/create_collections_info_user_usecase.dart';
import 'package:resilience_muscle/app_cubit.dart';

import '../registration_info_user/data/repositories/create_collections_info_user_repository_imp.dart';
import '../registration_info_user/data/repositories/create_new_user_with_email_repository_imp.dart';
import '../registration_info_user/domain/repositories/create_collections_info_user_repository.dart';
import '../registration_info_user/domain/repositories/create_new_user_with_email_repository.dart';
import '../registration_info_user/domain/usecases/create_collections_info_user_usecase_imp.dart';
import '../registration_info_user/domain/usecases/create_new_user_with_email_usecase_imp.dart';
import '../registration_info_user/presenter/usecases/create_new_user_with_email_usecase.dart';
import 'data/datasources/remote/firebase/firebase_remote_datasource_imp.dart';
import 'data/repositories/get_current_user_repository_imp.dart';
import 'data/repositories/is_email_duplicate_repository_imp.dart';
import 'data/repositories/is_info_user_collections_exists_repository_imp.dart.dart';
import 'data/repositories/sign_in_repository_imp.dart';
import 'domain/repositories/get_current_user_repository.dart';
import 'domain/repositories/is_email_duplicate_repository.dart';
import 'domain/repositories/is_info_user_collections_exists_repository.dart';
import 'domain/repositories/sign_in_repository.dart';
import 'domain/usecases/is_email_duplicate_usecase_imp.dart';
import 'domain/usecases/is_info_user_collections_exists_usecase_imp.dart';
import 'domain/usecases/sign_in_usecase_imp.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        ..._getRepositoryBinds(),
        ..._getUseCaseBinds(),
        ..._getCubitBinds(),
      ];

  List<Bind> _getRepositoryBinds() {
    return [
      Bind<IsEmailDuplicateRepository>(
        (i) => IsEmailDuplicateRepositoryImp(
            remoteDataSource: i<FirebaseRemoteDataSourceImp>()),
      ),
      Bind<CreateNewUserWithEmailRepository>(
        (i) => CreateNewUserWithEmailRepositoryImp(
            remoteDataSource: i<FirebaseRemoteDataSourceImp>()),
      ),
      Bind<SignInRepository>(
        (i) => SignInRepositoryImp(
            firebaseRemoteDataSource: i<FirebaseRemoteDataSourceImp>()),
      ),
      Bind<GetCurrentUserRepository>(
        (i) => GetCurrentUserRepositoryImp(
            firebaseRemoteDataSourceImp: i<FirebaseRemoteDataSourceImp>()),
      ),
      Bind<CreateCollectionsInfoUserRepository>(
        (i) => CreateCollectionsInfoUserRepositoryImp(
            remoteDataSource: i<FirebaseRemoteDataSourceImp>()),
      ),
      Bind<IsInfoUserCollectionsExistsRepository>(
        (i) => IsInfoUserCollectionsExistsRepositoryImp(
            remoteDataSource: i<FirebaseRemoteDataSourceImp>()),
      ),
    ];
  }

  List<Bind> _getUseCaseBinds() {
    return [
      Bind<IsEmailDuplicateUsecase>(
        (i) => IsEmailDuplicateUsecaseImp(
            repository: i<IsEmailDuplicateRepository>()),
      ),
      Bind<CreateNewUserWithEmailUsecase>(
        (i) => CreateNewUserWithEmailUsecaseImp(
            repository: i<CreateNewUserWithEmailRepositoryImp>()),
      ),
      Bind<SignInUseCase>(
        (i) => SignInUseCaseImp(signInRepository: i<SignInRepository>()),
      ),
      Bind<GetCurrentUserUsecase>(
        (i) =>
            GetCurrentUserUsecaseImp(repository: i<GetCurrentUserRepository>()),
      ),
      Bind<CreateCollectionsInfoUserUsecase>(
        (i) => CreateCollectionsInfoUserUsecaseImp(
            repository: i<CreateCollectionsInfoUserRepository>()),
      ),
      Bind<IsInfoUserCollectionsExistsUsecase>(
        (i) => IsInfoUserCollectionsExistsUsecaseImp(
            repository: i<IsInfoUserCollectionsExistsRepository>()),
      ),
    ];
  }

  List<Bind> _getCubitBinds() {
    return [
      Bind.singleton<SignInCubit>(
        (i) => SignInCubit(
          signInUseCase: i<SignInUseCase>(),
          isSignInUseCase: i<IsSignInUseCase>(),
          isInfoUserCollectionsExistsUsecase:
              i<IsInfoUserCollectionsExistsUsecase>(),
          appCubit: i<AppCubit>(),
        ),
      ),
      Bind.singleton<SignUpCubit>(
        (i) => SignUpCubit(
          createNewUserWithEmail: i<CreateNewUserWithEmailUsecase>(),
          isEmailDuplicateUsecase: i<IsEmailDuplicateUsecase>(),
        ),
      ),
    ];
  }

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SignInPage()),
    ChildRoute('/sign_up', child: (_, args) => const SignUpPage()),
  ];
}
