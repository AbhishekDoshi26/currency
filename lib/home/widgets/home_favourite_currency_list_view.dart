import 'package:currency/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFavouriteCurrencyListView extends StatelessWidget {
  const HomeFavouriteCurrencyListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final favouriteCurrency =
        context.select((HomeBloc bloc) => bloc.state.favouriteCurrency);

    final latestRates =
        context.select((HomeBloc bloc) => bloc.state.latestRatesModel);

    if (favouriteCurrency.isEmpty) {
      return const EmptyFavouriteCurrency();
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'NOTE: All rates include 7% markup/processing fees and base currency as USD.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: favouriteCurrency.length,
              separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color: Colors.grey.shade400,
              ),
              itemBuilder: (context, index) {
                final currency = favouriteCurrency[index];
                final rate = latestRates!.rates[currency]!;

                return CurrencyExpansionTile(
                  currency: currency,
                  rate: rate,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
