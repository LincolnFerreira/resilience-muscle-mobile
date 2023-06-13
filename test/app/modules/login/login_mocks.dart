import 'package:mocktail/mocktail.dart';
import 'package:resilience_muscle/app/modules/login/data/repositories/sign_in_repository_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/get_current_uid_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/is_sign_in_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/save_current_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/sign_in_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/sign_out_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/login/presentation/cubits/user_cubit.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/get_current_user_usecase.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/is_info_user_collections_exists_usecase.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/presenter/usecases/create_collections_info_user_usecase.dart';

class SignInUseCaseMock extends Mock implements SignInUseCaseImp {}

class SignInUseRepositoryMock extends Mock implements SignInRepositoryImp {}

class IsSignInUseCaseMock extends Mock implements IsSignInUseCaseImp {}

class GetCurrentIdUseCaseMock extends Mock implements GetCurrentUIdUseCaseImp {}

class SignOutUseCaseMock extends Mock implements SignOutUseCaseImp {}

class SaveCurrentUserUseCaseMock extends Mock
    implements SaveCurrentUserUseCaseImp {}

class GetCurrentUserUsecaseMock extends Mock implements GetCurrentUserUsecase {}

class IsInfoUserCollectionsExistsUsecaseMock extends Mock
    implements IsInfoUserCollectionsExistsUsecase {}

class UserCubitMock extends Mock implements UserCubit {}

class CreateCollectionsInfoUserUsecaseMock extends Mock
    implements CreateCollectionsInfoUserUsecase {}
