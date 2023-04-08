import 'package:currency/home/home.dart';
import 'package:currency/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.status == HomeStatus.error) {
          // Handle Error
          Navigator.of(context).pop();
        }
      },
      child: const Scaffold(
        backgroundColor: ColorConstants.primaryBackgroundColor,
        body: _HomeForm(),
      ),
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

    if (status == HomeStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
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
              : ListView.builder(
                  itemCount: favouriteCurrency.length,
                  itemBuilder: (context, index) => Text(
                    favouriteCurrency[index],
                  ),
                ),
        ),
      ],
    );
  }
}
