import 'package:currency/home/home.dart';
import 'package:currency/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCurrencyView extends StatelessWidget {
  const AddCurrencyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<HomeBloc>().add(const SaveFavouriteCurrency());
        return Future.value(true);
      },
      child: BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == HomeStatus.error) {
            context.showSnackBar(
              const SnackBar(
                content: Text('Oops! Something went wrong!'),
              ),
            );
          } else if (state.status == HomeStatus.savedSuccessfully) {
            Navigator.of(context).pop();
          }
        },
        child: const _AddCurrencyForm(),
      ),
    );
  }
}

class _AddCurrencyForm extends StatelessWidget {
  const _AddCurrencyForm();

  @override
  Widget build(BuildContext context) {
    final currencies = context.select((HomeBloc bloc) => bloc.state.currencies);
    final currencySymbols = currencies.keys.toList();
    final favouriteCurrency =
        context.select((HomeBloc bloc) => bloc.state.favouriteCurrency);

    return Stack(
      children: [
        Container(
          height: context.screenHeight,
          width: context.screenWidth,
          decoration: const BoxDecoration(
            gradient: ColorConstants.primaryGradient,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text(
              'Choose a currency',
              style: TextStyle(
                color: ColorConstants.primaryBackgroundColor,
              ),
            ),
            leading: IconButton(
              onPressed: () =>
                  context.read<HomeBloc>().add(const SaveFavouriteCurrency()),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: ColorConstants.primaryBackgroundColor,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          bottomNavigationBar: const SaveButton(),
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  child: CupertinoSearchTextField(
                    prefixInsets: const EdgeInsets.all(10),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: ColorConstants.primaryBackgroundColor,
                    ),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(height: 40),
                Expanded(
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
                      final isSelected =
                          favouriteCurrency.contains(currencySymbol);

                      return CurrencyItem(
                        currencySymbol: currencySymbol,
                        currencyValue: currencyValue,
                        isSelected: isSelected,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

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

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: InkWell(
        onTap: () {
          context.read<HomeBloc>().add(const SaveFavouriteCurrency());
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
          child: const Center(child: Text('Save Currency')),
        ),
      ),
    );
  }
}
