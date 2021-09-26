import 'package:flutter/material.dart';
import 'dCard.dart';

class dCard_card extends StatefulWidget {
  final dCard dcard;

  dCard_card({required this.dcard});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          maxHeight: 100.0,
          maxWidth: 350.0,
          minHeight: 60.0,
          minWidth: 300.0,
        ),
        child: InkWell(
          onTap: () {},
          child: Card(
            color: Color.fromRGBO(246, 240, 217, 1),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, top: 20.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.money,
                    color: Colors.green,
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    'Cash Payment',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        //fontFamily: 'Lato',
                        fontSize: 18,
                        letterSpacing: -0.30000001192092896,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
