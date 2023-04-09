import 'package:currency/add_currency/add_currency.dart';
import 'package:currency/utils/utils.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: InkWell(
        onTap: () {
          AddCurrencyView.saveCurrency(context);
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: ColorConstants.primaryBackgroundColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: ColorConstants.primaryBackgroundColor.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: const Center(
              child: Text(
            'Save Currency',
            style: TextStyle(
              color: ColorConstants.primaryColorLight,
            ),
          )),
        ),
      ),
    );
  }
}
