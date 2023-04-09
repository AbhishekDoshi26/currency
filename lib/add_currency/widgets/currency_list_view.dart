import 'package:currency/add_currency/add_currency.dart';
import 'package:currency/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyListView extends StatelessWidget {
  const CurrencyListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currencies =
        context.select((HomeBloc bloc) => bloc.state.searchedCurrencies);
    final currencySymbols = currencies.keys.toList();
    final favouriteCurrency =
        context.select((HomeBloc bloc) => bloc.state.favouriteCurrency);

    return Expanded(
      child: ListView.separated(
        itemCount: currencies.length,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => Divider(
          thickness: 1,
          color: Colors.grey.shade400,
        ),
        itemBuilder: (context, index) {
          final currencySymbol = currencySymbols[index];
          final currencyValue = currencies[currencySymbol];
          final isSelected = favouriteCurrency.contains(currencySymbol);

          return CurrencyItem(
            currencySymbol: currencySymbol,
            currencyValue: currencyValue,
            isSelected: isSelected,
          );
        },
      ),
    );
  }
}
