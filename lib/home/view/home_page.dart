import 'package:currency/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route({required HomeBloc bloc}) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider.value(
          value: bloc,
          child: const HomePage(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<HomeBloc>(),
      child: const HomeView(),
    );
  }
}
