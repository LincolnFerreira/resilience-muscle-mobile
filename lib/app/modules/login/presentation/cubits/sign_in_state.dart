// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  final bool isCreatedCollumnsInfoUser;

  const SignInState({
    this.isCreatedCollumnsInfoUser = false,
  });
}

class SignInInitial extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInLoading extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInSuccess extends SignInState {
  @override
  final bool isCreatedCollumnsInfoUser;

  const SignInSuccess({
    required this.isCreatedCollumnsInfoUser,
  });

  @override
  List<Object?> get props => [isCreatedCollumnsInfoUser];

  SignInSuccess copyWith({
    bool? isCreatedCollumnsInfoUser,
  }) {
    return SignInSuccess(
      isCreatedCollumnsInfoUser:
          isCreatedCollumnsInfoUser ?? this.isCreatedCollumnsInfoUser,
    );
  }
}

class SignInFailure extends SignInState {
  final String? message;

  const SignInFailure(this.message);
  @override
  List<Object?> get props => [message];
}
