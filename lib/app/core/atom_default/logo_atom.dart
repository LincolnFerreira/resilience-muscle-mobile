import 'package:flutter/material.dart';

class LogoImageWidget extends StatelessWidget {
  double? width;
  double? height;

  LogoImageWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      width: width,
      height: height,
    );
  }
}
