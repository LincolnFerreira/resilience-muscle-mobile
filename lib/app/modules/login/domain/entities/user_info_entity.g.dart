// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInfoEntityAdapter extends TypeAdapter<UserInfoEntity> {
  @override
  final int typeId = 1;

  @override
  UserInfoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInfoEntity(
      name: fields[0] as String?,
      birthDate: fields[1] as DateTime?,
      height: fields[2] as double?,
      weight: fields[3] as double?,
      trainingDivision: fields[4] as TrainingDivision?,
      fitnessGoals: fields[5] as FitnessGoals?,
      image: fields[6] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, UserInfoEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.birthDate)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.trainingDivision)
      ..writeByte(5)
      ..write(obj.fitnessGoals)
      ..writeByte(6)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoEntity _$UserInfoEntityFromJson(Map<String, dynamic> json) =>
    UserInfoEntity(
      name: json['name'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      trainingDivision: $enumDecodeNullable(
          _$TrainingDivisionEnumMap, json['trainingDivision']),
      fitnessGoals:
          $enumDecodeNullable(_$FitnessGoalsEnumMap, json['fitnessGoals']),
      image: json['image'],
    );

Map<String, dynamic> _$UserInfoEntityToJson(UserInfoEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birthDate': instance.birthDate?.toIso8601String(),
      'height': instance.height,
      'weight': instance.weight,
      'trainingDivision': _$TrainingDivisionEnumMap[instance.trainingDivision],
      'fitnessGoals': _$FitnessGoalsEnumMap[instance.fitnessGoals],
      'image': instance.image,
    };

const _$TrainingDivisionEnumMap = {
  TrainingDivision.groupMuscle: 'groupMuscle',
  TrainingDivision.bodyParts: 'bodyParts',
  TrainingDivision.moviments: 'moviments',
};

const _$FitnessGoalsEnumMap = {
  FitnessGoals.muscleGain: 'muscleGain',
  FitnessGoals.weightLoss: 'weightLoss',
  FitnessGoals.overallFitness: 'overallFitness',
  FitnessGoals.strengthIncrease: 'strengthIncrease',
  FitnessGoals.flexibilityImprovement: 'flexibilityImprovement',
  FitnessGoals.mentalWellness: 'mentalWellness',
};
