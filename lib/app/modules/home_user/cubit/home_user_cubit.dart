import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

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

  late UserInfoEntity userInfoEntity;
  late UserEntity userEntity;
  HomeUserCubit({
    // this.currentUser,
    // this.currentInfoUser,
    required this.boxUserEntityBox,
    required this.boxUserInfoEntity,
    required this.getCurrentUserUsecase,
    required this.getInfoUserUsecase,
    required this.appCubit,
  }) : super(HomeUserInitial()) {
    userInfoEntity = appCubit.state.userInfo;
    userEntity = appCubit.state.userEntity;
  }

  final Logger logger = Logger();
  Future<void> init() async {
    // await getInfoUser();
  }
}
