// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class RegistrationInfoUserState extends Equatable {
  final int? page;
  final bool? createdNewCollumns;

  const RegistrationInfoUserState({
    this.page,
    this.createdNewCollumns,
  });

  @override
  List<Object?> get props => [
        page,
        createdNewCollumns,
      ];

  RegistrationInfoUserState copyWith({
    int? page,
    bool? createdNewColumns,
  });
}

class RegistrationInfoUserInitial extends RegistrationInfoUserState {
  final int pageInitial;

  const RegistrationInfoUserInitial({
    required this.pageInitial,
  }) : super(page: pageInitial);

  @override
  RegistrationInfoUserState copyWith({
    int? page,
    bool? createdNewColumns,
  }) {
    return RegistrationInfoUserInitial(
      pageInitial: page ?? pageInitial,
    );
  }
}

class RegistrationInfoUserLoading extends RegistrationInfoUserState {
  const RegistrationInfoUserLoading() : super();

  @override
  RegistrationInfoUserState copyWith({
    int? page,
    bool? createdNewColumns,
  }) {
    return const RegistrationInfoUserLoading();
  }
}

class RegistrationInfoUserSuccess extends RegistrationInfoUserState {
  final int? page;
  final bool? createdNewColumns;

  const RegistrationInfoUserSuccess({
    this.page = 4,
    this.createdNewColumns,
  }) : super(
          page: page,
          createdNewCollumns: createdNewColumns,
        );

  @override
  RegistrationInfoUserState copyWith({
    int? page,
    bool? createdNewColumns,
  }) {
    return RegistrationInfoUserSuccess(
      page: page ?? page,
      createdNewColumns: createdNewColumns ?? this.createdNewColumns,
    );
  }
}

class RegistrationInfoUserFailure extends RegistrationInfoUserState {
  const RegistrationInfoUserFailure() : super();

  @override
  RegistrationInfoUserState copyWith({
    int? page,
    bool? createdNewColumns,
  }) {
    return const RegistrationInfoUserFailure();
  }
}
