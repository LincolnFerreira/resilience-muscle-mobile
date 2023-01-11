import 'package:json_annotation/json_annotation.dart';
import 'package:resilience_muscle/app/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  UserModel({
    uid,
    name,
    email,
    password,
  }) : super(
          uid: uid,
          name: name,
          email: email,
          password: password,
        );

  // factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
  //       uid: json['uid'],
  //       name: json['name'],
  //       email: json['email'],
  //       password: json['password'],
  //     );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
