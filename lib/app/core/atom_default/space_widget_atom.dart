import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SpaceWidgetAtom extends StatelessWidget {
  final double height;

  const SpaceWidgetAtom({super.key, required this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
