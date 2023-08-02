import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app_cubit.dart';
import '../login/data/datasources/remote/firebase/firebase_remote_datasource_imp.dart';
import '../login/domain/usecases/is_email_duplicate_usecase_imp.dart';
import 'data/repositories/create_collections_info_user_repository_imp.dart';
import 'domain/repositories/create_collections_info_user_repository.dart';
import 'domain/usecases/create_collections_info_user_usecase_imp.dart';
import 'presenter/atomic/template/onboarding_essential_information.dart';
import 'presenter/atomic/template/onboarding_registration_training.dart';
import 'presenter/cubits/registration_info_user_cubit.dart';
import 'presenter/pages/registration_info_user_page.dart';
import 'presenter/usecases/create_collections_info_user_usecase.dart';
import 'presenter/usecases/create_new_user_with_email_usecase.dart';

class RegistrationInfoUserModule extends Module {
  @override
  List<Bind> get binds => [
        ..._getRepositoryBinds(),
        ..._getUseCaseBinds(),
        ..._getCubitBinds(),
      ];

  List<Bind> _getRepositoryBinds() {
    return [
      Bind<CreateCollectionsInfoUserRepository>(
        (i) => CreateCollectionsInfoUserRepositoryImp(
          remoteDataSource: i<FirebaseRemoteDataSourceImp>(),
        ),
      ),
    ];
  }

  List<Bind> _getUseCaseBinds() {
    return [
      Bind<CreateCollectionsInfoUserUsecase>(
        (i) => CreateCollectionsInfoUserUsecaseImp(
          repository: i<CreateCollectionsInfoUserRepositoryImp>(),
        ),
      ),
    ];
  }

  List<Bind> _getCubitBinds() {
    return [
      Bind<RegistrationInfoUserCubit>(
        (i) => RegistrationInfoUserCubit(
          isEmailDuplicateUsecase: i<IsEmailDuplicateUsecaseImp>(),
          createNewUserWithEmail: i<CreateNewUserWithEmailUsecase>(),
          createCollectionsInfoUserUsecase:
              i<CreateCollectionsInfoUserUsecase>(),
          appCubit: i<AppCubit>(),
          imagePicker: i<ImagePicker>(),
        ),
      ),
    ];
  }

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const RegistrationInfoUserPage(),
    ),
    ChildRoute(
      '/onboarding_essential_information',
      child: (_, args) => const OnboardingEssentialInformation(),
    ),
    ChildRoute(
      '/onboarding_registration_training',
      child: (_, args) => const OnboardingRegistrationTraining(),
    ),
  ];
}
