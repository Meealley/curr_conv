import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:curr_convert/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 500,
      splashIconSize: 350,
      // backgroundColor: Colors.red,
      // splashTransition: SplashTransition.,
      pageTransitionType: PageTransitionType.leftToRight,
      // animationDuration: const Duration(seconds: 1),
      splash: Lottie.asset('assets/loading.json'),

      nextScreen: const HomePage(),
    );
  }
}
