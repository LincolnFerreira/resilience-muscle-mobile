// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class RegistrationInfoUserState extends Equatable {
  final int? page;
  final bool? createdNewCollumns;
  final dynamic imageSelectedProfile;

  const RegistrationInfoUserState({
    this.page,
    this.createdNewCollumns,
    this.imageSelectedProfile = '',
  });

  @override
  List<Object?> get props => [
        page,
        createdNewCollumns,
        imageSelectedProfile,
      ];

  RegistrationInfoUserState copyWith({
    int? page,
    bool? createdNewColumns,
    dynamic imageSelectedProfile,
  });
}

class RegistrationInfoUserInitial extends RegistrationInfoUserState {
  final int pageInitial;

  const RegistrationInfoUserInitial({
    required this.pageInitial,
  }) : super(page: pageInitial);

  @override
  RegistrationInfoUserState copyWith(
      {int? page, bool? createdNewColumns, dynamic imageSelectedProfile}) {
    return RegistrationInfoUserInitial(
      pageInitial: page ?? pageInitial,
    );
  }
}

class RegistrationInfoUserLoading extends RegistrationInfoUserState {
  const RegistrationInfoUserLoading() : super();

  @override
  RegistrationInfoUserState copyWith(
      {int? page, bool? createdNewColumns, dynamic imageSelectedProfile}) {
    return const RegistrationInfoUserLoading();
  }
}

class RegistrationInfoUserSuccess extends RegistrationInfoUserState {
  final int? page;
  final bool? createdNewColumns;
  final dynamic imageSelectedProfile;

  const RegistrationInfoUserSuccess({
    this.page = 4,
    this.createdNewColumns,
    this.imageSelectedProfile = '',
  }) : super(
          page: page,
          createdNewCollumns: createdNewColumns,
          imageSelectedProfile: imageSelectedProfile,
        );

  @override
  RegistrationInfoUserState copyWith(
      {int? page, bool? createdNewColumns, dynamic imageSelectedProfile}) {
    return RegistrationInfoUserSuccess(
      page: page ?? page,
      createdNewColumns: createdNewColumns ?? this.createdNewColumns,
    );
  }
}

class RegistrationInfoUserFailure extends RegistrationInfoUserState {
  const RegistrationInfoUserFailure() : super();

  @override
  RegistrationInfoUserState copyWith(
      {int? page, bool? createdNewColumns, dynamic imageSelectedProfile}) {
    return const RegistrationInfoUserFailure();
  }
}
