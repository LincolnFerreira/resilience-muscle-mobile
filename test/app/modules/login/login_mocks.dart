import 'package:mocktail/mocktail.dart';
import 'package:resilience_muscle/app/modules/login/data/repositories/sign_in_repository_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/get_current_uid/get_current_uid_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/is_sign_in/is_sign_in_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/save_user/save_current_user_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/sign_in/sign_in_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/sign_out/sign_out_usecase_imp.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/get_current_user_usecase.dart';

class SignInUseCaseMock extends Mock implements SignInUseCaseImp {}

class SignInUseRepositoryMock extends Mock implements SignInRepositoryImp {}

class IsSignInUseCaseMock extends Mock implements IsSignInUseCaseImp {}

class GetCurrentIdUseCaseMock extends Mock implements GetCurrentUIdUseCaseImp {}

class SignOutUseCaseMock extends Mock implements SignOutUseCaseImp {}

class SaveCurrentUserUseCaseMock extends Mock
    implements SaveCurrentUserUseCaseImp {}

class GetCurrentUserUsecaseMock extends Mock implements GetCurrentUserUsecase {}
