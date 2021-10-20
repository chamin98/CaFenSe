import 'package:cafense_admin/helpers/local_navigator.dart';
import 'package:cafense_admin/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class MediumScreen extends StatelessWidget {
  const MediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SideMenu()),
        Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
               child: localNavigator(),
            ))
      ],
    );
  }
}
