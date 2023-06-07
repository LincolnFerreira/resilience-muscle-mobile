import 'package:json_annotation/json_annotation.dart';

class UserInfoEntity {
  final Map<String, bool>
      isCompleted; // saber se ele já completou as informações
  final bool name; // como gostaria de ser chamado
  final bool gender; // sexo
  final DateTime birthDate; // data de nascimento
  final double userHeight; // altura
  final TrainingDivision trainingDivision;
  // TODO: FALTANDO ORGANIZAR A ROTINA DE TREINO

  UserInfoEntity(
    this.isCompleted,
    this.name,
    this.gender,
    this.birthDate,
    this.userHeight,
    this.trainingDivision,
  );
}

enum TrainingDivision { weekly, sequence }
