import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resilience_muscle/app/domain/usecases/sign_in/sign_in_usecase_imp.dart';
import 'package:resilience_muscle/app/presentation/modules/login/cubit/sign_in_state.dart';

import '../../../../domain/usecases/sign_in/sign_in_usecase.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase signInUseCase;
  // LoginRepository signInRepository;
  SignInCubit(
    this.signInUseCase,
    // this.signInRepository,
  ) : super(SignInState.initial());

  void loading() {
    emit(state.copyWith(status: SignInStatus.loading));
  }

  Future<void> submitSignIn(String email, String password) async {
    try {
      await signInUseCase.call(email, password);
      // print('cubit login');
    } catch (e) {
      // print(e);
    }
  }
}
