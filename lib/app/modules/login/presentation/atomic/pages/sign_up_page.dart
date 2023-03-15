import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final LoginStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
