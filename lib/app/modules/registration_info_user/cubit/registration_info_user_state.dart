import 'package:equatable/equatable.dart';

abstract class RegistrationInfoUserState extends Equatable {
  final int page;
  final bool? isValidateConfirmPassword;

  const RegistrationInfoUserState({
    required this.page,
    this.isValidateConfirmPassword,
  });

  @override
  List<Object?> get props => [page, isValidateConfirmPassword];
}

class RegistrationInfoUserInitial extends RegistrationInfoUserState {
  const RegistrationInfoUserInitial({
    required int page,
    bool? isValidateConfirmPassword,
  }) : super(page: page, isValidateConfirmPassword: isValidateConfirmPassword);
}

class RegistrationInfoUserLoading extends RegistrationInfoUserState {
  const RegistrationInfoUserLoading({
    required int page,
    bool? isValidateConfirmPassword,
  }) : super(page: page, isValidateConfirmPassword: isValidateConfirmPassword);
}

class RegistrationInfoUserSuccess extends RegistrationInfoUserState {
  final int? newPage; // Novo campo page opcional

  RegistrationInfoUserSuccess({
    this.newPage,
    bool? isValidateConfirmPassword,
  }) : super(
          page: newPage!,
          isValidateConfirmPassword: isValidateConfirmPassword,
        );

  @override
  int get page =>
      newPage ??
      super
          .page; // Sobrescrevendo o getter page para retornar o novo campo newPage se estiver definido
}

class RegistrationInfoUserFailure extends RegistrationInfoUserState {
  const RegistrationInfoUserFailure({
    required int page,
    bool? isValidateConfirmPassword,
  }) : super(page: page, isValidateConfirmPassword: isValidateConfirmPassword);
}
