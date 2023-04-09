import 'package:currency/home/home.dart';
import 'package:currency/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyItem extends StatelessWidget {
  const CurrencyItem({
    super.key,
    required this.currencySymbol,
    required this.currencyValue,
    required this.isSelected,
  });

  final String currencySymbol;
  final String? currencyValue;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            currencySymbol,
            style: const TextStyle(
              color: ColorConstants.primaryBackgroundColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            width: context.screenWidth / 1.8,
            child: Text(
              currencyValue!,
              style: const TextStyle(
                color: ColorConstants.primaryBackgroundColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<HomeBloc>().add(
                    UpdateFavouriteCurrency(
                      currency: currencySymbol,
                      isSelected: isSelected,
                    ),
                  );
            },
            icon: Icon(
              isSelected ? Icons.favorite : Icons.favorite_border_outlined,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
