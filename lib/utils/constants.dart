import 'package:flutter/material.dart';

/// Holds all constants related to colors.
class ColorConstants {
  /// The blue shade available in the app icon and splash screen
  static const primaryBackgroundColor = Color.fromRGBO(1, 2, 69, 1);

  /// The primary light color instead of pure white.
  static const Color primaryColorLight = Color.fromRGBO(238, 240, 245, 1);

  /// The primary second light color which
  /// can be used with [primaryColorLight] for gradient.
  static const Color primaryColorLight2 = Color.fromRGBO(219, 223, 234, 1);

  /// The primary [LinearGradient] created from [primaryColorLight]
  /// and [primaryColorLight2].
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      primaryColorLight,
      primaryColorLight2,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

/// Class that holds constants related to rate conversions.
class ConversionConstants {
  /// Method that counts the markupFees applied on the [exchangedBaseValue].
  static double markupFees(double exchangedBaseValue) =>
      exchangedBaseValue * 0.07;

  /// Method that returns the conversion value
  /// from the given [rate] and [amount].
  static String getConversion({
    required double rate,
    double amount = 1,
    String symbol = r'$',
  }) {
    /// The conversion rate for the amount based on the rate provided
    /// without the markup/processing fees.
    final exchangedBaseValue = amount * (1 / rate);

    /// The conversion rate for the amount based on the rate provided
    /// with the markup/processing fees.
    final rateAfterMarkup = exchangedBaseValue - markupFees(exchangedBaseValue);

    /// The conversion rate for the amount based on the rate provided
    /// with the markup/processing fees fixed to 3 decimals
    /// along with the currency symbol which is by default `$`.
    final rateString = rateAfterMarkup.toStringAsFixed(3).toString() + symbol;

    return rateString;
  }
}
