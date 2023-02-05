// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

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
  // LoginRepository signInRepository;
  SignInCubit(
    // this.signInRepository,
    this.signInUseCase,
    this.isSignInUseCase,
    this.getCurrentUIdUseCase,
    this.signOutUseCase,
  ) : super(SignInState.initial());

  final Logger logger = Logger();
  void loading() {
    emit(state.copyWith(status: SignInStatus.loading));
  }

  Future<void> submitSignIn(String email, String password) async {
    emit(state.copyWith(status: SignInStatus.loading));
    try {
      final signIn = await signInUseCase
          .call(UserEntity(email: email, password: password));

      final isSignIn = await isSignInUseCase();
      if (isSignIn) {
        emit(state.copyWith(status: SignInStatus.success));
      } else {
        emit(state.copyWith(status: SignInStatus.failure));
      }
    } on SocketException catch (_) {
      emit(state.copyWith(status: SignInStatus.failure));
      // print(e);
    } catch (_) {
      emit(state.copyWith(status: SignInStatus.failure));
    }
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
