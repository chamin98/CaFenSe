import 'package:cafense_admin/pages/orders/widgets/info_card.dart';
import 'package:flutter/material.dart';

class OrdersCardsLargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Row(children: [
      InfoCard(
        title: "Foods Sold",
        value: "0",
        topColor: Colors.orange,
      ),
      SizedBox(width: _width / 64),
      InfoCard(
        title: "Orders Completed",
        value: "0",
        topColor: Colors.lightGreen,
      ),
      SizedBox(width: _width / 64),
      InfoCard(
        title: "Orders To Complete",
        value: "0",
        topColor: Colors.redAccent,
      ),
      SizedBox(width: _width / 64)
    ]);
  }
}
