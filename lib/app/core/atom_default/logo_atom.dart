import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoAtom extends StatelessWidget {
  final double? width;
  final double? height;

  const LogoAtom({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo-theme-light.svg',
      width: width,
      height: height,
    );
  }
}
