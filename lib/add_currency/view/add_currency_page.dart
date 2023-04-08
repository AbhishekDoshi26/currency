import 'package:currency/add_currency/add_currency.dart';
import 'package:currency/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCurrencyPage extends StatelessWidget {
  const AddCurrencyPage({super.key});

  static Route<void> route() =>
      MaterialPageRoute(builder: (context) => const AddCurrencyPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<HomeBloc>(),
      child: const AddCurrencyView(),
    );
  }
}
