import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset(
        'assets/images/splash_screen_light.json',
        repeat: false,
        onLoaded: (p0) => Future.delayed(
          const Duration(seconds: 2),
          () => Modular.to.navigate('login/'),
        ),
      ),
      nextScreen: const Text('Loading...'),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
