import 'package:cafense_admin/controllers/controllers.dart';
import 'package:cafense_admin/helpers/responsiveness.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:cafense_admin/pages/foods/widgets/avaiable_foods.dart';

class FoodsPage extends StatelessWidget {
  const FoodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Obx(() => Row(children: [
              Container(
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 8),
                  child: Text(menuController.activeItem.value,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)))
            ])),
        SizedBox(height: 15),
        Expanded(child: AvailableFoodsTable())
      ],
    ));
  }
}
