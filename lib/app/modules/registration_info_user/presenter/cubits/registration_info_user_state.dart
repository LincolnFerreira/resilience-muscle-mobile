import 'package:equatable/equatable.dart';

abstract class RegistrationInfoUserState extends Equatable {
  final int page;
  final bool? isValidateConfirmPassword;
  final bool? createdNewUser;

  const RegistrationInfoUserState({
    required this.page,
    this.isValidateConfirmPassword,
    this.createdNewUser,
  });

  @override
  List<Object?> get props => [
        page,
        isValidateConfirmPassword,
        createdNewUser,
      ];
}

class RegistrationInfoUserInitial extends RegistrationInfoUserState {
  const RegistrationInfoUserInitial({
    required int page,
    bool? isValidateConfirmPassword,
    bool? createdNewUser,
  }) : super(
          page: page,
          isValidateConfirmPassword: isValidateConfirmPassword,
          createdNewUser: createdNewUser,
        );
}

class RegistrationInfoUserLoading extends RegistrationInfoUserState {
  const RegistrationInfoUserLoading({
    required int page,
    bool? isValidateConfirmPassword,
    bool? createdNewUser,
  }) : super(
          page: page,
          isValidateConfirmPassword: isValidateConfirmPassword,
          createdNewUser: createdNewUser,
        );
}

class RegistrationInfoUserSuccess extends RegistrationInfoUserState {
  const RegistrationInfoUserSuccess({
    int? newPage,
    bool? isValidateConfirmPassword,
    bool? createdNewUser,
  }) : super(
          page: newPage ?? 4,
          isValidateConfirmPassword: isValidateConfirmPassword,
          createdNewUser: createdNewUser,
        );
}

class RegistrationInfoUserFailure extends RegistrationInfoUserState {
  const RegistrationInfoUserFailure({
    required int page,
    bool? isValidateConfirmPassword,
    bool? createdNewUser,
  }) : super(
          page: page,
          isValidateConfirmPassword: isValidateConfirmPassword,
          createdNewUser: createdNewUser,
        );
}
