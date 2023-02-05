// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PolygonAtom extends StatelessWidget {
  final AlignmentGeometry alignment;
  final double rotateAngle;
  final double width;

  const PolygonAtom({
    Key? key,
    required this.alignment,
    required this.rotateAngle,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      // const Alignment(0.1, 0.0),
      child: Transform.rotate(
        angle: rotateAngle,
        child: Image.asset(
          'assets/images/Polygon.png',
          width: width,
        ),
      ),
    );
  }
}
