import 'package:currency/utils/utils.dart';
import 'package:flutter/material.dart';

class Ripple extends StatelessWidget {
  const Ripple({
    required this.rect,
    required this.animationDuration,
    super.key,
  });

  final Rect? rect;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    if (rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      duration: animationDuration,
      left: rect!.left,
      right: MediaQuery.of(context).size.width - rect!.right,
      top: rect!.top,
      bottom: MediaQuery.of(context).size.height - rect!.bottom,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorConstants.primaryBackgroundColor,
        ),
      ),
    );
  }
}
