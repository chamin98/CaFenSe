import 'package:flutter/material.dart';

const int smallScreenSize = 380;
const int mediumScreenSize = 800;

class ResponsiveWidget extends StatelessWidget {
  final Widget smallScreen;
  final Widget mediumScreen;
  final Widget largeScreen;

  const ResponsiveWidget({
    Key? key,
    required this.smallScreen,
    required this.largeScreen,
    required this.mediumScreen,
  }) : super(key: key);

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > mediumScreenSize;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > smallScreenSize &&
      MediaQuery.of(context).size.width <= mediumScreenSize;

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width <= smallScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;
      if (_width > mediumScreenSize) {
        return largeScreen;
      } else if (_width > smallScreenSize) {
        return mediumScreen;
      } else {
        return smallScreen;
      }
    });
  }
}
