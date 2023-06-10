part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final bool createdNewUser;

  const SignUpSuccess({this.createdNewUser = false});

  @override
  List<Object?> get props => [
        createdNewUser,
      ];
}

class SignUpFailure extends SignUpState {
  final String errorMessage;

  const SignUpFailure(this.errorMessage);

  @override
  List<Object?> get props => [
        errorMessage,
      ];
}
