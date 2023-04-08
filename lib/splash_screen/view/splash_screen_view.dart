import 'package:currency/home/home.dart';
import 'package:currency/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorConstants.primaryBackgroundColor,
      body: _SplashScreenForm(),
    );
  }
}

class _SplashScreenForm extends StatefulWidget {
  const _SplashScreenForm();

  @override
  State<_SplashScreenForm> createState() => _SplashScreenFormState();
}

class _SplashScreenFormState extends State<_SplashScreenForm>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _initialiseController();
  }

  void _initialiseController() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )
      ..forward()
      ..addListener(
        () async {
          if (_controller.isCompleted) {
            await Future.delayed(const Duration(seconds: 3)).then((value) =>
                context.read<HomeBloc>().add(const LoadInitialHomeData()));
          }
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.status == HomeStatus.loaded) {
          Navigator.of(context).pushReplacement(HomePage.route());
        }
      },
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return AnimatedRotation(
              turns: _controller.value * 6,
              duration: const Duration(seconds: 3),
              curve: Curves.decelerate,
              child: SizedBox(
                height: _controller.value * 1000,
                child: Image.asset('assets/background.jpg'),
              ),
            );
          },
        ),
      ),
    );
  }
}
