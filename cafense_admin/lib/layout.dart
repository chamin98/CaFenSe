import 'package:flutter/material.dart';

import 'helpers/local_navigator.dart';
import 'screens/large_screens.dart';
import 'helpers/responsiveness.dart';
import 'screens/medium_screen.dart';
import 'widgets/side_menu.dart';
import 'widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  SiteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: ResponsiveWidget.isSmallScreen(context)
          ? const Drawer(child: SideMenu())
          : null,
      body: ResponsiveWidget(
          largeScreen: LargeScreen(),
          mediumScreen: MediumScreen(),
          smallScreen: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: localNavigator(),
          )),
    );
  }
}
