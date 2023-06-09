import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/get_current_user_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/sign_in/sign_in_usecase.dart';
import 'package:resilience_muscle/app/modules/login/presentation/atomic/pages/sign_in_page.dart';
import 'package:resilience_muscle/app/modules/login/presentation/atomic/pages/sign_up_page.dart';
import 'package:resilience_muscle/app/modules/login/presentation/cubit/sign_in_cubit.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/get_current_user_usecase.dart';

import 'data/datasources/remote/firebase/firebase_remote_datasource_imp.dart';
import 'data/repositories/get_current_user_repository_imp.dart';
import 'data/repositories/sign_in_repository_imp.dart';
import 'domain/entities/user_entity.dart';
import 'domain/repositories/get_current_user_repository.dart';
import 'domain/repositories/sign_in_repository.dart';
import 'domain/usecases/get_current_uid/get_current_uid_usecase.dart';
import 'domain/usecases/is_sign_in/is_sign_in_usecase.dart';
import 'domain/usecases/save_user/save_current_usecase.dart';
import 'domain/usecases/sign_in/sign_in_usecase_imp.dart';
import 'domain/usecases/sign_out/sign_out_usecase.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<SignInRepository>((i) => SignInRepositoryImp(
        firebaseRemoteDataSource: i<FirebaseRemoteDataSourceImp>())),
    Bind<SignInUseCase>(
      (i) => SignInUseCaseImp(signInRepository: i<SignInRepository>()),
    ),

    Bind<GetCurrentUserRepository>((i) => GetCurrentUserRepositoryImp(
        firebaseRemoteDataSourceImp: i<FirebaseRemoteDataSourceImp>())),
    Bind<GetCurrentUserUsecase>(
        (i) => GetCurrentUserUsecaseImp(repository: i())),

    //cubit
    Bind.singleton<SignInCubit>(
      (i) => SignInCubit(
        signInUseCase: i<SignInUseCase>(),
        isSignInUseCase: i<IsSignInUseCase>(),
        getCurrentUIdUseCase: i<GetCurrentUIdUseCase>(),
        signOutUseCase: i<SignOutUseCase>(),
        saveCurrentUserUseCase: i<SaveCurrentUserUseCase>(),
        getCurrentUserUsecase: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SignInPage()),
    ChildRoute('/signUp', child: (_, args) => const SignUpPage()),
  ];
}
