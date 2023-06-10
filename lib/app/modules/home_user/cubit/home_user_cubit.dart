// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/get_current_user_usecase.dart';

import '../../login/domain/entities/user_entity.dart';

part 'home_user_state.dart';

class HomeUserCubit extends Cubit<HomeUserState> {
  final Box<UserEntity> userEntityBox;
  final GetCurrentUserUsecase getCurrentUserUsecase;
  HomeUserCubit({
    required this.getCurrentUserUsecase,
    required this.userEntityBox,
  }) : super(
          HomeUserInitial(),
        );

  Future<void> getUser() async {
    final String? uid = userEntityBox.get('user')?.uid;
    if (uid == null) {
      Modular.to.navigate('/login/');
      return;
    }
    try {
      final res = getCurrentUserUsecase(uid);
      print('response current user $res');
    } catch (e) {
      print(e);
    }
  }

  void init() {
    getUser();
  }
}
