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
  final bool? disabled;
  final bool? loading;

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
    this.disabled = false,
    this.loading = false,
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
    this.disabled = false,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading == true) {
      return SizedBox(
        width: width,
        height: heigth,
        child:
            const CircularProgressIndicator(), // Exemplo de botão customizado para quando o loading está ativo
      );
    } else if (disabled == true) {
      return SizedBox(
        width: width,
        height: heigth,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors
                .grey, // Exemplo de botão customizado para quando está desabilitado
            foregroundColor: Colors.black,
          ),
          onPressed: null,
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
    } else {
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
  }
}
