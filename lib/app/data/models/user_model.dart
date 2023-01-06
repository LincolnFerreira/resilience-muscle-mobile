import 'package:resilience_muscle/app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required id,
    required name,
    required email,
    required password,
  }) : super(
          id: id,
          name: name,
          email: email,
          password: password,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
      );
}
