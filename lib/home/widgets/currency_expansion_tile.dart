import 'package:currency/home/home.dart';
import 'package:flutter/material.dart';

class CurrencyExpansionTile extends StatelessWidget {
  const CurrencyExpansionTile({
    super.key,
    required this.currency,
    required this.rate,
  });

  final String currency;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        trailing: const SizedBox.shrink(),
        title: CurrencyExpansionHeader(
          currency: currency,
          rate: rate,
        ),
        children: [
          CurrencyConversionWidget(
            currency: currency,
            rate: rate,
          ),
        ],
      ),
    );
  }
}
