import 'package:json_annotation/json_annotation.dart';
import 'package:resilience_muscle/app/modules/login/domain/entities/user_info_entity.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel extends UserInfoEntity {
  UserInfoModel({
    required String name,
    required DateTime birthDate,
    required double height,
    required double weight,
    required TrainingDivision? trainingDivision,
    required FitnessGoals? fitnessGoals,
  }) : super(
          name: name,
          birthDate: birthDate,
          height: height,
          weight: weight,
          trainingDivision: trainingDivision,
          fitnessGoals: fitnessGoals,
        );
}
