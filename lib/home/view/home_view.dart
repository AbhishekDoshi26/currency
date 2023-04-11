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
  /// The key that will get the rect of the widget.
  GlobalKey<RectGetterState> rectGetterKey = RectGetter.createGlobalKey();

  /// Rect that needs to be obtained.
  /// It is nullable because it is obtained only after the build method
  /// has been executed successfully.
  Rect? rect;

  /// Duration of the animation for the rippple effect.
  final Duration animationDuration = const Duration(milliseconds: 300);

  /// Duration of the delay of animation for the ripple effect.
  final Duration delay = const Duration(milliseconds: 300);

  /// Method to be used as onTap of a widget which will
  /// create the ripple effect navigation
  void onTap() async {
    setState(() => rect = RectGetter.getRectFromKey(rectGetterKey)!);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(
          () => rect = rect!.inflate(MediaQuery.of(context).size.longestSide));
      Future.delayed(animationDuration + delay, _goToNextPage);
    });
  }

  /// Method that redirects the user to next page with Fade Animation.
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
