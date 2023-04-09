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

class ConversionConstants {
  static String getConversion({
    required double rate,
    double amount = 1,
    String symbol = r'$',
  }) {
    final conversionRate = amount * (1 / rate);
    final rateAfterMarkup = conversionRate - (conversionRate * 0.07);
    return rateAfterMarkup.toStringAsFixed(3).toString() + symbol;
  }
}
