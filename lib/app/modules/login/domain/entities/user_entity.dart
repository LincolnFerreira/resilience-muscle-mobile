import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class UserEntity extends HiveObject {
  @HiveField(0)
  late String uid;
  @HiveField(1)
  late String email;

  late String password;

  UserEntity({
    this.uid = '',
    this.email = '',
    this.password = '',
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
