// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InputAtom extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final Color? textColor;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final bool? filled;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hintColor;
  final Color? labelColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  const InputAtom({
    Key? key,
    this.controller,
    this.onChanged,
    required this.labelText,
    this.hintText,
    this.obscureText = false,
    this.textColor = Colors.white,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.filled,
    this.fillColor,
    this.focusColor,
    this.hintColor,
    this.labelColor,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.all(40),
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
        border: border ?? const OutlineInputBorder(),
        filled: filled,
        fillColor: fillColor ?? Colors.white,
        enabledBorder: enabledBorder ??
            const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
        focusedBorder: focusedBorder,
        focusColor: focusColor,
        labelStyle: TextStyle(color: labelColor ?? Colors.grey),
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: prefixIcon,
              ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(20.0),
          child: suffixIcon,
        ),
      ),
      validator: validator,
    );
  }
}
