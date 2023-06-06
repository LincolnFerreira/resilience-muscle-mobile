// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';

enum SignInStatus { initial, loading, success, failure }

class SignInState extends Equatable {
  final SignInStatus status;

  const SignInState({
    this.status = SignInStatus.initial,
  });

  SignInState copyWith({
    SignInStatus? status,
    UserEntity? userEntity,
  }) {
    return SignInState(
      status: status ?? this.status,
    );
  }

  factory SignInState.initial() {
    return const SignInState(
      status: SignInStatus.initial,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
