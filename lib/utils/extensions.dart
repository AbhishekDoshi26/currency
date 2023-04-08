import 'package:flutter/material.dart';

/// Extension methods on BuildContext
extension ContextExtension on BuildContext {
  ///Extension method on BuildContext to show a snackbar.
  ///It takes [snackBar] as the parameter of type SnackBar.
  ///If you are creating your own SnackBar, it's suggested to extend the class with SnackBar.
  ///Example to create your own SnackBar class:
  ///```
  ///class CustomSnackBar extends SnackBar {
  ///CustomSnackBar({
  ///  super.key,
  ///  required this.message,
  ///}) : super(
  ///        content: Text(message),
  ///         backgroundColor: Colors.black,
  ///      );
  ///  final String message;
  ///}
  ///```
  ///
  void showSnackBar(SnackBar snackBar) =>
      ScaffoldMessenger.of(this).showSnackBar(snackBar);

  ///Extension method on BuildContext to get the screenHeight.
  ///It returns MediaQuery.of(context).size.height
  ///
  double get screenHeight => MediaQuery.of(this).size.height;

  ///Extension method on BuildContext to get the screenWidth.
  ///It returns MediaQuery.of(context).size.width
  ///
  double get screenWidth => MediaQuery.of(this).size.width;

  ///Extension method on BuildContext to get the screen aspectRatio.
  ///It returns MediaQuery.of(context).size.aspectRatio
  ///
  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;
}
