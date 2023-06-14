// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {}

class SignInInitial extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInLoading extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInSuccess extends SignInState {
  final bool? isCreatedCollumnsInfoUser;

  SignInSuccess({
    this.isCreatedCollumnsInfoUser,
  });

  @override
  List<Object?> get props => [isCreatedCollumnsInfoUser];
}

class SignInFailure extends SignInState {
  @override
  List<Object?> get props => [];
}
