import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/atomic/template/registration_info_user_main.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/atomic/template/registration_info_user_weight.dart';
import 'package:resilience_muscle/app/modules/registration_info_user/registration_info_user_store.dart';
import 'package:flutter/material.dart';

class RegistrationInfoUserPage extends StatefulWidget {
  final String title;
  const RegistrationInfoUserPage(
      {Key? key, this.title = 'RegistrationInfoUserPage'})
      : super(key: key);
  @override
  RegistrationInfoUserPageState createState() =>
      RegistrationInfoUserPageState();
}

class RegistrationInfoUserPageState extends State<RegistrationInfoUserPage> {
  final RegistrationInfoUserStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return const RegistrationInfoUserMain(
      registrationPageStep: RegistrationInfoUserWeight(),
      currentStep: 1,
    );
  }
}
