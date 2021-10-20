import 'package:flutter/material.dart';

import 'info_card.dart';

class OrdersCardsLargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Row(children: [
      InfoCard(
        title: "Foods Sold",
        value: "16",
        topColor: Colors.orange,
      ),
      SizedBox(width: _width / 64),
      InfoCard(
        title: "Orders Completed",
        value: "43",
        topColor: Colors.lightGreen,
      ),
      SizedBox(width: _width / 64),
      InfoCard(
        title: "Orders To Complete",
        value: "3",
        topColor: Colors.redAccent,
      ),
      SizedBox(width: _width / 64)
    ]);
  }
}
