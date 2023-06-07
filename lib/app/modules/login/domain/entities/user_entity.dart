import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class UserEntity extends HiveObject {
  @HiveField(0)
  late String uid;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String email;
  @HiveField(3)
  late dynamic image;
  late String password;

  UserEntity({
    this.uid = '',
    this.name = '',
    this.email = '',
    this.password = '',
    this.image = '',
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
