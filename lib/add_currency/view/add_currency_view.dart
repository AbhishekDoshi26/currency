import 'package:currency/add_currency/add_currency.dart';
import 'package:currency/home/home.dart';
import 'package:currency/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCurrencyView extends StatelessWidget {
  const AddCurrencyView({Key? key}) : super(key: key);

  static void saveCurrency(BuildContext context) {
    context.read<HomeBloc>()
      ..add(const SaveFavouriteCurrency())
      ..add(const SearchTextChanged(searchString: ''));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        saveCurrency(context);
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
              onPressed: () => AddCurrencyView.saveCurrency(context),
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
              children: const [
                SearchBar(),
                SizedBox(height: 40),
                CurrencyListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
