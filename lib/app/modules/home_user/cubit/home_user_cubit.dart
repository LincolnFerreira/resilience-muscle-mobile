// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../login/domain/entities/user_entity.dart';

part 'home_user_state.dart';

class HomeUserCubit extends Cubit<HomeUserState> {
  final Box<UserEntity> userEntityBox;
  HomeUserCubit({
    required this.userEntityBox,
  }) : super(HomeUserInitial());

  Future<void> getUser() async {
    print('cache: ${userEntityBox.get('user')?.toJson()}');
  }

  void init() {
    getUser();
  }
}
