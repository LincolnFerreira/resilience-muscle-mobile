// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';

enum SignInStatus { initial, loading, success, failure }

abstract class SignInState extends Equatable {
  final SignInStatus status;
  final UserEntity? userEntity;
  final bool isInfoUserCollectionsExistsUsecase;

  const SignInState({
    this.status = SignInStatus.initial,
    this.userEntity,
    this.isInfoUserCollectionsExistsUsecase = false,
  });

  @override
  List<Object?> get props => [
        status,
        userEntity,
        isInfoUserCollectionsExistsUsecase,
      ];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final UserEntity? newUserEntity;
  final bool newIsInfoUserCollectionsExistsUsecase;

  const SignInSuccess({
    this.newUserEntity,
    this.newIsInfoUserCollectionsExistsUsecase = false,
  }) : super(
          isInfoUserCollectionsExistsUsecase:
              newIsInfoUserCollectionsExistsUsecase,
          userEntity: newUserEntity,
        );
}

class SignInFailure extends SignInState {}
