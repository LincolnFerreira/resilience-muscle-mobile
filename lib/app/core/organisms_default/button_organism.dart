// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../ui/colors.dart';

class ButtonOrganism extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? heigth;
  final String textButton;
  final Color? textColor;
  final Widget? child;
  final double? textSize;

  const ButtonOrganism({
    Key? key,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.heigth,
    required this.textButton,
    this.textColor,
    this.child,
    this.textSize,
  }) : super(key: key);

  const ButtonOrganism.primary({
    Key? key,
    required this.onPressed,
    this.backgroundColor = ColorsUI.primary,
    this.foregroundColor = ColorsUI.primary,
    this.width,
    this.heigth,
    required this.textButton,
    this.textColor = ColorsUI.white,
    this.child,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: heigth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        onPressed: onPressed,
        child: child ??
            Text(
              textButton,
              style: TextStyle(
                color: textColor,
                fontSize: textSize ?? 14,
              ),
            ),
      ),
    );
  }

  // const ButtonOrganism.icon({
  //   super.key,
  //   required this.onPressed,
  //   this.backgroundColor,
  //   this.foregroundColor,
  //   this.width,
  //   this.heigth,
  //   required this.textButton,
  //   this.textColor,
  //   this.child,
  //   this.textSize,
  // });
}
