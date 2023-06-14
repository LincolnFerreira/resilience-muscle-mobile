// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      name: json['name'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      trainingDivision: $enumDecodeNullable(
          _$TrainingDivisionEnumMap, json['trainingDivision']),
      fitnessGoals:
          $enumDecodeNullable(_$FitnessGoalsEnumMap, json['fitnessGoals']),
      image: json['image'],
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
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
