// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    )..image = json['image'];

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'password': instance.password,
    };
