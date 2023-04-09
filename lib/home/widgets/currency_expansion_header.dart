import 'package:currency/utils/utils.dart';
import 'package:flutter/material.dart';

class CurrencyExpansionHeader extends StatelessWidget {
  const CurrencyExpansionHeader({
    required this.currency,
    required this.rate,
    super.key,
  });

  /// Individual currency symbol.
  final String currency;

  /// Exchange rate of the [currency].
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '1 $currency',
            style: const TextStyle(
              color: ColorConstants.primaryBackgroundColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.compare_arrows,
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ConversionConstants.getConversion(rate: rate),
                style: const TextStyle(
                  color: ColorConstants.primaryBackgroundColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
