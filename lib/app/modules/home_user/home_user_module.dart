import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/login/data/datasources/remote/firebase/firebase_remote_datasource_imp.dart';

import '../login/data/repositories/get_current_user_repository_imp.dart';
import '../login/domain/repositories/get_current_user_repository.dart';
import '../login/domain/usecases/get_current_user_usecase_imp.dart';
import '../login/presentation/usecase/get_current_user_usecase.dart';
import 'cubit/home_user_cubit.dart';
import 'home_user_page.dart';

class HomeUserModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<GetCurrentUserRepository>((i) => GetCurrentUserRepositoryImp(
            firebaseRemoteDataSourceImp: i<FirebaseRemoteDataSourceImp>())),
        Bind<GetCurrentUserUsecase>(
          (i) => GetCurrentUserUsecaseImp(
              repository: i<GetCurrentUserRepository>()),
        ),
        Bind.singleton<HomeUserCubit>(
          (i) => HomeUserCubit(
            userEntityBox: i(),
            getCurrentUserUsecase: i<GetCurrentUserUsecase>(),
          ),
        ),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomeUserPage()),
  ];
}
