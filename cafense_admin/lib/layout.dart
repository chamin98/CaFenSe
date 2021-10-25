import 'package:flutter/material.dart';
import 'package:cafense_admin/helpers/local_navigator.dart';
import 'package:cafense_admin/screens/large_screens.dart';
import 'package:cafense_admin/helpers/responsiveness.dart';
import 'package:cafense_admin/screens/medium_screen.dart';
import 'package:cafense_admin/widgets/side_menu.dart';
import 'package:cafense_admin/widgets/top_nav.dart';

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
