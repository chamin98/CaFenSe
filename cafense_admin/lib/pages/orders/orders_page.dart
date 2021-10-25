import 'package:cafense_admin/controllers/controllers.dart';
import 'package:cafense_admin/helpers/responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cafense_admin/pages/orders/widgets/available_orders.dart';
import 'package:cafense_admin/pages/orders/widgets/orders_cards_large.dart';
import 'package:cafense_admin/pages/orders/widgets/orders_cards_medium.dart';
import 'package:cafense_admin/pages/orders/widgets/orders_cards_small.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Obx(() => Row(children: [
              Container(
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 8),
                  child: Text(
                    menuController.activeItem.value,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ))
            ])),
        Expanded(
            child: ListView(children: [
          if (ResponsiveWidget.isLargeScreen(context))
            OrdersCardsLargeScreen()
          else if (ResponsiveWidget.isMediumScreen(context))
            OrdersCardsMediumScreen()
          else
            OrdersCardsSmallScreen(),
           const SizedBox(height: 10),
        AvailableOrdersTable(),
        ]))
      ],
    ));
  }
}
