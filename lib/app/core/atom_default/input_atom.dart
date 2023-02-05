// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../colors.dart';

class InputAtom extends StatelessWidget {
  final double? width;
  final double? height;
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
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? keyboardType;

  const InputAtom({
    Key? key,
    this.controller,
    this.onChanged,
    required this.labelText,
    this.hintText,
    this.obscureText = false,
    this.textColor = Pallete.dark,
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
    this.width,
    this.height,
    this.autovalidateMode,
    this.inputFormatter,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 47,
      width: width,
      child: TextFormField(
        keyboardType: keyboardType,
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
          fillColor: fillColor ?? Pallete.dark,
          enabledBorder: enabledBorder ??
              const OutlineInputBorder(
                  borderSide: BorderSide(color: Pallete.dark)),
          focusedBorder: focusedBorder,
          focusColor: focusColor,
          labelStyle: TextStyle(color: labelColor ?? Pallete.dark),
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
        autovalidateMode: autovalidateMode,
        inputFormatters: inputFormatter,
      ),
    );
  }
}
