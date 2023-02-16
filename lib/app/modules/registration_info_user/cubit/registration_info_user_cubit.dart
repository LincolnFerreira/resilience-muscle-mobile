import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_info_user_state.dart';

class RegistrationInfoUserCubit extends Cubit<RegistrationInfoUserState> {
  RegistrationInfoUserCubit()
      : super(const RegistrationInfoUserInitial(page: 0));

  void onTapButton() {
    emit(RegistrationInfoUserSuccess(page: state.page + 1));
  }
}
