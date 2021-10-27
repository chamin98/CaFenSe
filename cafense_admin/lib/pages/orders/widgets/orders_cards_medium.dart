import 'package:cafense_admin/pages/orders/widgets/info_card.dart';
import 'package:flutter/material.dart';



class OrdersCardsMediumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(children: [
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
        )
      ]),
      SizedBox(height: _width / 64),
      Row(children: [
        InfoCard(
          title: "Orders To Completey",
          value: "0",
          topColor: Colors.redAccent,
        )
      ])
    ]);
  }
}
