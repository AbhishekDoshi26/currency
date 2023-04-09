import 'package:flutter/material.dart';

class EmptyFavouriteCurrency extends StatelessWidget {
  const EmptyFavouriteCurrency({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No currency added to your favourite! 😢',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
