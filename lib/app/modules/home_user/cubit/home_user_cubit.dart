import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

import 'package:resilience_muscle/app/modules/login/presentation/usecase/get_current_user_usecase.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/get_info_user_usecase.dart';
import 'package:resilience_muscle/app_cubit.dart';

import '../../login/domain/entities/user_entity.dart';
import '../../login/domain/entities/user_info_entity.dart';

part 'home_user_state.dart';

class HomeUserCubit extends Cubit<HomeUserState> {
  final Box<UserEntity> boxUserEntityBox;
  final Box<UserInfoEntity> boxUserInfoEntity;
  final GetCurrentUserUsecase getCurrentUserUsecase;
  final GetInfoUserUsecase getInfoUserUsecase;
  final AppCubit appCubit;
  // UserEntity? currentUser;
  // UserInfoEntity? currentInfoUser;
  late UserInfoEntity userInfoEntity;
  HomeUserCubit({
    // this.currentUser,
    // this.currentInfoUser,
    required this.boxUserEntityBox,
    required this.boxUserInfoEntity,
    required this.getCurrentUserUsecase,
    required this.getInfoUserUsecase,
    required this.appCubit,
  }) : super(HomeUserInitial()) {
    // currentUser = boxUserEntityBox.get('user') as UserEntity;
    // currentInfoUser = boxUserEntityBox.get('infoUser') as UserInfoEntity;
    userInfoEntity = appCubit.state.userInfo;
  }

  Future<void> init() async {
    getInfoUser();
    getUser();
  }

  Future<void> getUser() async {
    final String uid = userInfoEntity.name!;
    // if (uid == null) {
    //   Modular.to.navigate('/login/');
    //   return;
    // }
    try {
      final res = getCurrentUserUsecase(uid);
    } catch (e) {}
  }

  Future<void> getInfoUser() async {
    final String? uid = userInfoEntity.name;
    if (uid == null) {
      Modular.to.navigate('/login/');
      return;
    }
    try {
      final res = await getInfoUserUsecase(uid);
      res.fold((failure) {}, (infoUser) {
        boxUserInfoEntity.put('infoUser', infoUser);
      });
    } catch (e) {}
  }
}
