import 'package:currency/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  Route<void> route(BuildContext context) =>
      MaterialPageRoute(builder: (context) => const SplashScreenPage());

  @override
  Widget build(BuildContext context) {
    return const SplashScreenView();
  }
}
