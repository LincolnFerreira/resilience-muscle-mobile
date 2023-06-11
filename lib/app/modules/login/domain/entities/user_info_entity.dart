import 'package:json_annotation/json_annotation.dart';

part 'user_info_entity.g.dart';

@JsonSerializable()
class UserInfoEntity {
  final String name;
  final DateTime birthDate;
  final double height;
  final double weight;
  final TrainingDivision? trainingDivision;
  final FitnessGoals? fitnessGoals;

  UserInfoEntity({
    required this.name,
    required this.birthDate,
    required this.height,
    required this.weight,
    required this.trainingDivision,
    required this.fitnessGoals,
  });
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
