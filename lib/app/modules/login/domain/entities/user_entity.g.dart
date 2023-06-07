// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final int typeId = 0;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      uid: fields[0] as String,
      name: fields[1] as String,
      email: fields[2] as String,
      image: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      uid: json['uid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      image: json['image'] ?? '',
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'password': instance.password,
    };
