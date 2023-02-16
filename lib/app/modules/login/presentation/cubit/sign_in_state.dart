import 'package:equatable/equatable.dart';

enum SignInStatus { initial, loading, success, failure }

class SignInState extends Equatable {
  const SignInState({
    this.status = SignInStatus.initial,
  });

  final SignInStatus status;
  SignInState copyWith({
    SignInStatus? status,
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
  List<Object?> get props => [status];
}
