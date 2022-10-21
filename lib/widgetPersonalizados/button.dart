import 'dart:ffi';

import 'package:flutter/material.dart';

import '../class/cores.dart';

class Button extends StatelessWidget {
  final String textButton;

  // final Function onPressed;

  // final List variaveis;
  const Button(
    this.textButton,
    // this.onPressed,
    // this.variaveis,
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // onPressed;
        },
        style: ElevatedButton.styleFrom(
          primary: Pallete.primary,
          alignment: Alignment.centerLeft,
        ),
        child: Text(textButton));
  }
}
