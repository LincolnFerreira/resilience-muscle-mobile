import 'package:flutter_modular/flutter_modular.dart';
import 'package:resilience_muscle/app/modules/forget_password/forget_password_store.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  final String title;
  const ForgetPasswordPage({Key? key, this.title = 'ForgetPasswordPage'})
      : super(key: key);
  @override
  ForgetPasswordPageState createState() => ForgetPasswordPageState();
}

class ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final ForgetPasswordStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Column(
        children: <Widget>[],
      ),
    );
  }
}
