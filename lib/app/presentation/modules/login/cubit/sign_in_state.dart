enum SignInStatus { initial, loading, success, failure }

class SignInState {
  final String email;
  final String password;
  SignInStatus status;

  SignInState({
    required this.email,
    required this.password,
    required this.status,
  });

  SignInState copyWith({
    String? email,
    String? password,
    SignInStatus? status,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  factory SignInState.initial() {
    return SignInState(
      email: '',
      password: '',
      status: SignInStatus.initial,
    );
  }
}
