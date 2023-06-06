import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_info_user_state.dart';

class RegistrationInfoUserCubit extends Cubit<RegistrationInfoUserState> {
  RegistrationInfoUserCubit()
      : super(const RegistrationInfoUserInitial(page: 0));

  final TextEditingController textController = TextEditingController();

  void onTapButton() {
    emit(RegistrationInfoUserSuccess(page: state.page + 1));
  }

  void onTapButtonContinue() {
    emit(RegistrationInfoUserSuccess(page: state.page + 1));
  }

  void finishSignIn(
      String name, String birthDate, double height, double weight) {
    print(name);
    print(birthDate);
    print(height);
    print(weight);
  }
}
