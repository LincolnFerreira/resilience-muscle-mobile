// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/colors.dart';

class ToggleThemeAtom extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final Color? color;
  const ToggleThemeAtom({
    Key? key,
    this.child,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 250,
      height: height ?? 58,
      decoration: BoxDecoration(
        color: color ?? Pallete.dark.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: child,
    );
  }
}
