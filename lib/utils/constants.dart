import 'package:flutter/material.dart';

class ColorConstants {
  static const primaryBackgroundColor = Color.fromRGBO(1, 2, 69, 1);

  static const Color primaryColorLight = Color.fromRGBO(238, 240, 245, 1);

  static const Color primaryColorLight2 = Color.fromRGBO(219, 223, 234, 1);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      primaryColorLight,
      primaryColorLight2,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
