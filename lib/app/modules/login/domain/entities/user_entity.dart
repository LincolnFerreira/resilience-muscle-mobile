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
  late String password;

  UserEntity({
    this.uid = '',
    this.name = '',
    this.email = '',
    this.password = '',
  });

  UserEntity copyWith({
    String? uid,
    String? name,
    String? email,
    String? password,
  }) {
    return UserEntity(
      email: uid ?? this.uid,
      name: name ?? this.name,
      password: password ?? this.password,
      uid: uid ?? this.uid,
    );
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
