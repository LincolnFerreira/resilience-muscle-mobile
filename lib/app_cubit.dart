import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import 'package:resilience_muscle/app/modules/login/domain/entities/user_entity.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_info_entity.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/get_info_user_usecase.dart';
import 'package:resilience_muscle/app/modules/login/presentation/usecase/is_sign_in_usecase.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final IsSignInUseCase isSignInUseCase;
  final Box<UserEntity> boxUserEntity;
  final Box<UserInfoEntity> boxUserInfoEntity;
  final GetInfoUserUsecase getInfoUserUsecase;
  AppCubit({
    required this.isSignInUseCase,
    required this.boxUserEntity,
    required this.boxUserInfoEntity,
    required this.getInfoUserUsecase,
  }) : super(AppState(
          userInfo: UserInfoEntity(),
          userEntity: UserEntity(),
        ));
  final Logger logger = Logger();

  Future<void> init() async {
    getCurrentUser();
    await getInfoUser();
    appStarted();
    logger.i(state.userEntity.toJson());
  }

  Future<void> getCurrentUser() async {
    try {
      final UserEntity userEntity = boxUserEntity.get('user') as UserEntity;

      emit(state.copyWith(userEntity: userEntity));
    } catch (e) {
      logger.e('Erro ao obter o usuário atual: $e');
    }
  }

  Future<void> getInfoUser() async {
    final String uid = state.userEntity.uid;
    if (uid == '') {
      return;
    }
    try {
      final res = await getInfoUserUsecase(uid);
      res.fold(
        (failure) {},
        (infoUser) {
          // boxUserInfoEntity.put('infoUser', infoUser);
          updateUserInfo(infoUser);
          logger.i(state.userInfo.toJson());
        },
      );
    } catch (e) {
      logger.d('Erro ao pegar informações do usuário');
    }
  }

  Future<void> appStarted() async {
    try {
      final res = await isSignInUseCase();
      res.fold(
        (failure) {
          logger.e('Erro no caso de uso de login: $failure');
        },
        (isSignIn) {
          emit(state.copyWith(isLogged: isSignIn));
        },
      );
      if (state.isLogged) {
        logger.i(state.userEntity.toJson());
        Modular.to.pushNamed('home_user');
      } else {
        Modular.to.pushNamed('/login/');
      }
      logger.i('logado: ${state.isLogged}');
    } catch (e) {
      logger.e('Erro durante a execução de appStarted: $e');
    }
  }

  void updateUserInfo(UserInfoEntity newUserInfoEntity) {
    emit(state.copyWith(userInfo: newUserInfoEntity));
  }

  Future<void> clearCaches() async {
    await boxUserEntity.get('user')?.delete();
    await boxUserEntity.get('infoUser')?.delete();
  }
}
