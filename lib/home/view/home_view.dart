import 'package:currency/add_currency/add_currency.dart';
import 'package:currency/home/home.dart';
import 'package:currency/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rect_getter/rect_getter.dart';

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

class _HomeForm extends StatefulWidget {
  const _HomeForm();

  @override
  State<_HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<_HomeForm> {
  GlobalKey<RectGetterState> rectGetterKey = RectGetter.createGlobalKey();
  Rect? rect;
  final Duration animationDuration = const Duration(milliseconds: 300);
  final Duration delay = const Duration(milliseconds: 300);

  void onTap() async {
    setState(() => rect = RectGetter.getRectFromKey(rectGetterKey)!);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() =>
          rect = rect!.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      Future.delayed(animationDuration + delay, _goToNextPage);
    });
  }

  void _goToNextPage() {
    Navigator.of(context)
        .push(FadeRouteBuilder(page: const AddCurrencyPage()))
        .then((_) {
      setState(() => rect = null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final status = context.select((HomeBloc bloc) => bloc.state.status);

    if (status == HomeStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        Scaffold(
          backgroundColor: ColorConstants.primaryBackgroundColor,
          floatingActionButton: RectGetter(
            key: rectGetterKey,
            child: FloatingActionButton(
              onPressed: onTap,
              backgroundColor: ColorConstants.primaryBackgroundColor,
              child: const Icon(
                Icons.add,
                color: ColorConstants.primaryColorLight,
              ),
            ),
          ),
          body: const HomeBody(),
        ),
        Ripple(
          rect: rect,
          animationDuration: animationDuration,
        ),
      ],
    );
  }
}
