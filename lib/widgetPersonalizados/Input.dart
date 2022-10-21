import 'package:flutter/material.dart';

import '../class/cores.dart';

class Input extends StatelessWidget {
  final Color cor;
  final String hindText;
  final String labelText;
  final bool isObscureText;
  final dynamic onChanged;
  final dynamic controller;
  Input({
    required this.cor,
    required this.hindText,
    required this.labelText,
    required this.isObscureText, this.onChanged, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      // onChanged: (onChanged){
      //   print(onChanged);
      // },
      obscureText: isObscureText,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Pallete.primaryLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Pallete.white,
          ),
        ),
        focusedBorder:
            const OutlineInputBorder(borderSide: BorderSide(width: 0)),
        hintText: hindText,
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 15,
          fontFamily: 'Inter',
          color: Pallete.white,
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }
}
