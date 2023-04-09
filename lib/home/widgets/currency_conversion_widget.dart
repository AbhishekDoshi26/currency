import 'package:currency/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyConversionWidget extends StatefulWidget {
  const CurrencyConversionWidget({
    required this.currency,
    required this.rate,
    super.key,
  });

  /// Individual currency symbol.
  final String currency;

  /// Exchange rate of the [currency].
  final double rate;

  @override
  State<CurrencyConversionWidget> createState() =>
      _CurrencyConversionWidgetState();
}

class _CurrencyConversionWidgetState extends State<CurrencyConversionWidget> {
  /// [TextEditingController] used for the textField used for amount
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: CupertinoTextField(
            controller: _textEditingController,
            onChanged: (value) {
              setState(() {});
            },
            decoration: BoxDecoration(
              color: CupertinoColors.tertiarySystemFill,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(10),
            placeholder: 'Amount',
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            prefix: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.currency,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        if (_textEditingController.text.isNotEmpty) const SizedBox(width: 20),
        if (_textEditingController.text.isNotEmpty)
          Expanded(
            child: Text(
              ConversionConstants.getConversion(
                rate: widget.rate,
                amount: double.parse(_textEditingController.text),
              ),
              style: const TextStyle(
                color: ColorConstants.primaryBackgroundColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
