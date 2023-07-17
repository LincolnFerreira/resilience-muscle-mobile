import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreenAtom extends StatelessWidget {
  const OnboardingScreenAtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF0A061E), // #0A061E
          Color(0xFF3E2AB8), //
        ],
      ),
    ));
  }
}
