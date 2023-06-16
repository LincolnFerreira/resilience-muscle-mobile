// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info_entity.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class UserInfoEntity {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final DateTime? birthDate;
  @HiveField(2)
  final double? height;
  @HiveField(3)
  final double? weight;
  @HiveField(4)
  final TrainingDivision? trainingDivision;
  @HiveField(5)
  final FitnessGoals? fitnessGoals;
  @HiveField(6)
  late dynamic image;

  UserInfoEntity({
    this.name,
    this.birthDate,
    this.height,
    this.weight,
    this.trainingDivision,
    this.fitnessGoals,
    this.image,
  });

  UserInfoEntity copyWith({
    String? name,
    DateTime? birthDate,
    double? height,
    double? weight,
    TrainingDivision? trainingDivision,
    FitnessGoals? fitnessGoals,
    dynamic image,
  }) {
    return UserInfoEntity(
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      trainingDivision: trainingDivision ?? this.trainingDivision,
      fitnessGoals: fitnessGoals ?? this.fitnessGoals,
      image: image ?? this.image,
    );
  }

  @override
  String toString() {
    return 'UserInfoEntity(name: $name, birthDate: $birthDate, height: $height, weight: $weight, trainingDivision: $trainingDivision, fitnessGoals: $fitnessGoals)';
  }

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$UserInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoEntityToJson(this);
}

enum TrainingDivision {
  groupMuscle,
  bodyParts,
  moviments,
}

enum FitnessGoals {
  muscleGain,
  weightLoss,
  overallFitness,
  strengthIncrease,
  flexibilityImprovement,
  mentalWellness,
}
