// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:resilience_muscle/app/modules/login/data/datasources/remote/firebase/firebase_remote_datasource_imp.dart';

import '../../login/domain/entities/user_entity.dart';

part 'home_user_state.dart';

class HomeUserCubit extends Cubit<HomeUserState> {
  final firebaseRemoteDataSourceImp = FirebaseRemoteDataSourceImp();
  var userEntity = Modular.get<UserEntity>();

  HomeUserCubit() : super(HomeUserInitial());

  Future<void> getUser() async {
    final box = await Hive.openBox('user');
    final UserEntity userEntityBox = box.get('user');
    print('cache: ${userEntityBox.toJson()}');
  }

  void init() {
    getUser();
  }
}
