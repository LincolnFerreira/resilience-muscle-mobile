import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  final String uid;
  final String name;
  final String email;
  final String password;

  UserEntity({
    this.uid = '',
    this.name = '',
    this.email = '',
    this.password = '',
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
