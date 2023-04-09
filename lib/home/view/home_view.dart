import 'package:currency/add_currency/add_currency.dart';
import 'package:currency/home/home.dart';
import 'package:currency/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == HomeStatus.error) {}
      },
      child: const _HomeForm(),
    );
  }
}

class _HomeForm extends StatelessWidget {
  const _HomeForm();

  @override
  Widget build(BuildContext context) {
    final status = context.select((HomeBloc bloc) => bloc.state.status);
    final favouriteCurrency =
        context.select((HomeBloc bloc) => bloc.state.favouriteCurrency);

    final latestRates =
        context.select((HomeBloc bloc) => bloc.state.latestRatesModel);

    if (status == HomeStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    final TextEditingController textEditingController = TextEditingController();

    return Scaffold(
      backgroundColor: ColorConstants.primaryBackgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(AddCurrencyPage.route());
        },
        backgroundColor: ColorConstants.primaryBackgroundColor,
        child: const Icon(
          Icons.add,
          color: ColorConstants.primaryColorLight,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 150,
              left: 30,
              right: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hello!',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.primaryColorLight,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Are you ready to get your currency exchanged? 💸',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
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
            child: favouriteCurrency.isEmpty
                ? const Center(
                    child: Text(
                      'No currency added to your favourite! 😢',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  )
                : Padding(
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

                              return Theme(
                                data: Theme.of(context)
                                    .copyWith(dividerColor: Colors.transparent),
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
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class CurrencyConversionWidget extends StatefulWidget {
  const CurrencyConversionWidget({
    required this.currency,
    required this.rate,
    super.key,
  });

  final String currency;
  final double rate;

  @override
  State<CurrencyConversionWidget> createState() =>
      _CurrencyConversionWidgetState();
}

class _CurrencyConversionWidgetState extends State<CurrencyConversionWidget> {
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

class CurrencyExpansionHeader extends StatelessWidget {
  const CurrencyExpansionHeader({
    required this.currency,
    required this.rate,
    super.key,
  });

  final String currency;
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
