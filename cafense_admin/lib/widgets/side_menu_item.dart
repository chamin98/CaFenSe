import 'package:cafense_admin/helpers/responsiveness.dart';
import 'package:flutter/material.dart';

import 'package:cafense_admin/widgets/menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap;
  const SideMenuItem({Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isMediumScreen(context)) {
      return VerticalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );
    } else {
      return HorizontalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );
    }
  }
}
