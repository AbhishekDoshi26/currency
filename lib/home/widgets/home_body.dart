import 'package:currency/home/home.dart';
import 'package:currency/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeHeader(),
        const Spacer(),
        Container(
          height: context.screenHeight / 1.8,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            gradient: ColorConstants.primaryGradient,
          ),
          child: const HomeFavouriteCurrencyListView(),
        ),
      ],
    );
  }
}
