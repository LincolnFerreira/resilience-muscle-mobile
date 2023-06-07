import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  final String title;
  const ForgetPasswordPage({Key? key, this.title = 'ForgetPasswordPage'})
      : super(key: key);
  @override
  ForgetPasswordPageState createState() => ForgetPasswordPageState();
}

class ForgetPasswordPageState extends State<ForgetPasswordPage> {
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
