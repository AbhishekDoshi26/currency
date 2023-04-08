import 'package:api_repository/api_repository.dart';
import 'package:currency/home/home.dart';
import 'package:currency/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  Route<void> route(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) {
        return const SplashScreenPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(apiRepository: context.read<ApiRepository>()),
      child: const SplashScreenView(),
    );
  }
}
