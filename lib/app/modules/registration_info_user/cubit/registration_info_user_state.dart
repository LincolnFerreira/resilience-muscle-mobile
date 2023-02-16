part of 'registration_info_user_cubit.dart';

abstract class RegistrationInfoUserState extends Equatable {
  final int page;

  const RegistrationInfoUserState({
    required this.page,
  });

  @override
  List<Object> get props => [page];
}

class RegistrationInfoUserInitial extends RegistrationInfoUserState {
  const RegistrationInfoUserInitial({required super.page});
}

class RegistrationInfoUserLoading extends RegistrationInfoUserState {
  const RegistrationInfoUserLoading({required super.page});
}

class RegistrationInfoUserSuccess extends RegistrationInfoUserState {
  const RegistrationInfoUserSuccess({required super.page});
}

class RegistrationInfoUserFailure extends RegistrationInfoUserState {
  const RegistrationInfoUserFailure({required super.page});
}
