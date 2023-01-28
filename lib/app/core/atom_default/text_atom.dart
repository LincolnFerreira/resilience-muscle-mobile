// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextAtom extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextStyle? style;
  const TextAtom({
    Key? key,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.textAlign,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
          ),
    );
  }
}
