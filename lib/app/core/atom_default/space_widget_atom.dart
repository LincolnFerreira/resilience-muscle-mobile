import 'package:flutter/material.dart';

class SpaceWidgetAtom extends StatelessWidget {
  final double height;

  const SpaceWidgetAtom({super.key, required this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
