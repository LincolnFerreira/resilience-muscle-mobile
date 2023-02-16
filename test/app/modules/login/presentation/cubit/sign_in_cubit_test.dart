import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/get_current_uid/get_current_uid_usecase.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/is_sign_in/is_sign_in_usecase.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/sign_in/sign_in_usecase.dart';
import 'package:resilience_muscle/app/modules/login/domain/usecases/sign_out/sign_out_usecase.dart';
import 'package:resilience_muscle/app/modules/login/presentation/cubit/sign_in_cubit.dart';
import 'package:resilience_muscle/app/modules/login/presentation/cubit/sign_in_state.dart';

import '../../login_mocks.dart';

void main() {
  late UserEntity userEntity;
  late SignInUseCase signInUseCaseMock;
  late IsSignInUseCase isSignInUseCaseMock;
  late GetCurrentUIdUseCase getCurrentUIdUseCaseMock;
  late SignOutUseCase signOutUseCaseMock;
  late SignInCubit signInCubit;

  setUp(() {
    userEntity = UserEntity(
      email: 'lincoln@gmail.com',
      password: 'admin123',
    );
    signInUseCaseMock = SignInUseCaseMock();
    isSignInUseCaseMock = IsSignInUseCaseMock();
    getCurrentUIdUseCaseMock = GetCurrentIdUseCaseMock();
    signOutUseCaseMock = SignOutUseCaseMock();

    signInCubit = SignInCubit(
      signInUseCase: signInUseCaseMock,
      isSignInUseCase: isSignInUseCaseMock,
      getCurrentUIdUseCase: getCurrentUIdUseCaseMock,
      signOutUseCase: signOutUseCaseMock,
    );

    when(() => signInUseCaseMock(userEntity))
        .thenAnswer((_) async => const Right(null));
  });

  group('should call method\'s the [signInCubit]', () {
    blocTest<SignInCubit, SignInState>('should call method [submitSignIn]',
        build: () => signInCubit,
        act: (cubit) async =>
            cubit.submitSignIn('lincoln@gmail.com', 'admin123'),
        expect: () => <SignInState>[
              const SignInState(status: SignInStatus.loading),
              const SignInState(status: SignInStatus.success),
            ]);
  });
}
