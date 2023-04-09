import 'package:currency/utils/utils.dart';
import 'package:flutter/material.dart';

class Ripple extends StatelessWidget {
  const Ripple({
    required this.rect,
    required this.animationDuration,
    super.key,
  });

  /// Rect of the widget from where the animation needs to be started.
  final Rect? rect;

  /// Duration of the animation.
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    if (rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      duration: animationDuration,
      left: rect!.left,
      right: context.screenWidth - rect!.right,
      top: rect!.top,
      bottom: context.screenHeight - rect!.bottom,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorConstants.primaryBackgroundColor,
        ),
      ),
    );
  }
}
