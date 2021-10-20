import 'package:cafense_admin/helpers/responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      title: Container(
          child: Row(children: [
        Expanded(child: Container()),
        if (ResponsiveWidget.isLargeScreen(context))
          StreamBuilder(
              stream: Stream.periodic(const Duration(minutes: 1)),
              builder: (context, snapshot) {
                return Text(
                    "Today " +
                        DateFormat('d MMMM y kk:mm').format(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ));
              })
        else if (ResponsiveWidget.isMediumScreen(context))
          StreamBuilder(
              stream: Stream.periodic(const Duration(minutes: 1)),
              builder: (context, snapshot) {
                return Text(DateFormat('d MMM y kk:mm').format(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ));
              })
      ])),
      backgroundColor: Colors.transparent,
      elevation: 0);
}
