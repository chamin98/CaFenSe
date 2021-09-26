import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

class paymentMethod extends StatefulWidget {
  /*void showLayoutGuidelines() {
    debugPaintSizeEnabled = true;
  }*/

  const paymentMethod({Key? key}) : super(key: key);

  @override
  _paymentMethodState createState() => _paymentMethodState();
}

class _paymentMethodState extends State<paymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          top: true,
          bottom: true,
          left: true,
          right: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //flex: 1,
                child: Text(
                  'Payment Method',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      //fontFamily: 'Work Sans',
                      fontSize: 36,
                      letterSpacing: -0.30000001192092896,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(231, 108, 61, 1),
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/addcard');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 126.0, top: 16.0, bottom: 16.0, right: 107.0),
                      child: Text(
                        '+ Add new card',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(232, 108, 61, 1),
                            //fontFamily: 'Lato',
                            fontSize: 16,
                            letterSpacing: -0.30000001192092896,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    )),
              ),
              Container(
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
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 20.0, bottom: 20.0),
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
              Container(
                child: FlatButton(
                    color: Color.fromRGBO(240, 119, 73, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/orderSuccess');
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 19.0, horizontal: 115.5),
                        child: Text(
                          'Done',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              //fontFamily: 'Work Sans',
                              fontSize: 20,
                              letterSpacing: 1,
                              fontWeight: FontWeight.normal,
                              height: 0.9),
                        ))),
              ),
              SizedBox(
                height: 5.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
