import 'package:cafense_admin/pages/orders/widgets/info_card_small.dart';
import 'package:flutter/material.dart';


class OrdersCardsSmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
        height: 250,
        child: Column(children: [
          InfoCardSmall(
            title: "Foods Sold",
            value: "7",
          ),
          SizedBox(height: _width / 64),
          InfoCardSmall(
            title: "Orders Completed",
            value: "17",
          ),
          SizedBox(height: _width / 64),
          InfoCardSmall(
            title: "Orders To Complete",
            value: "3",
          ),
          SizedBox(height: _width / 64)
        ]));
  }
}
