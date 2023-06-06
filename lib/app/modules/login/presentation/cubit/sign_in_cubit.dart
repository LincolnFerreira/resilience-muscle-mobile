// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

import 'package:resilience_muscle/app/modules/login/domain/usecases/save_user/save_current_usecase.dart';
import 'package:resilience_muscle/app/modules/login/presentation/cubit/sign_in_state.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_current_uid/get_current_uid_usecase.dart';
import '../../domain/usecases/is_sign_in/is_sign_in_usecase.dart';
import '../../domain/usecases/sign_in/sign_in_usecase.dart';
import '../../domain/usecases/sign_out/sign_out_usecase.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase signInUseCase;
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUIdUseCase getCurrentUIdUseCase;
  final SignOutUseCase signOutUseCase;
  final SaveCurrentUserUseCase saveCurrentUserUseCase;

  var userEntity = Modular.get<UserEntity>();

  SignInCubit({
    // this.signInRepository,
    required this.signInUseCase,
    required this.isSignInUseCase,
    required this.getCurrentUIdUseCase,
    required this.signOutUseCase,
    required this.saveCurrentUserUseCase,
  }) : super(SignInState.initial());

  final Logger logger = Logger();
  void loading() {
    emit(state.copyWith(status: SignInStatus.loading));
  }

  Future<void> submitSignIn(String email, String password) async {
    emit(state.copyWith(status: SignInStatus.loading));

    try {
      final signIn = await signInUseCase
          .call(UserEntity(email: email, password: password));

      signIn.fold(
        (failure) {
          emit(state.copyWith(status: SignInStatus.failure));
        },
        (right) async {
          emit(state.copyWith(
            status: SignInStatus.success,
          ));
          saveUser(right);
        },
      );
    } catch (_) {
      emit(state.copyWith(status: SignInStatus.failure));
    }
  }

  Future<void> saveUser(UserEntity currentUser) async {
    try {
      await saveCurrentUserUseCase(currentUser);
    } catch (e) {}
  }

  Future<void> appStarted() async {
    try {
      final isSignIn = await isSignInUseCase.call();
      if (isSignIn) {
        final uid = await getCurrentUIdUseCase.getCurrentUId();
        logger.i('uid: $uid');
      } else {
        logger.i('deslogado');
      }
    } on SocketException catch (_) {
      logger.i('deslogado catch');
    }
  }
}
