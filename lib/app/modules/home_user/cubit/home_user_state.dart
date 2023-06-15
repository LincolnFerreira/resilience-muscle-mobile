// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_user_cubit.dart';

abstract class HomeUserState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeUserInitial extends HomeUserState {}

class HomeUserLoading extends HomeUserState {}

class HomeUserSuccess extends HomeUserState {
  final UserEntity? userEntity;
  final UserInfoEntity? userInfoEntity;
  HomeUserSuccess({
    this.userEntity,
    this.userInfoEntity,
  });
}

class HomeUserFailure extends HomeUserState {}
