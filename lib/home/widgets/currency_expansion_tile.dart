import 'package:currency/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyExpansionTile extends StatelessWidget {
  const CurrencyExpansionTile({
    super.key,
    required this.currency,
    required this.rate,
  });

  /// Individual currency symbol.
  final String currency;

  /// Exchange rate of the [currency].
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        trailing: IconButton(
          onPressed: () {
            context.read<HomeBloc>()
              ..add(
                UpdateFavouriteCurrency(currency: currency, isSelected: true),
              )
              ..add(const SaveFavouriteCurrency());
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red.shade600,
          ),
        ),
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
