import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafense_mobile/widgets/button1.dart';

class checkOut extends StatefulWidget {
  const checkOut({Key? key}) : super(key: key);

  @override
  _checkOutState createState() => _checkOutState();
}

class _checkOutState extends State<checkOut> {
  int num = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Cart",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            paymentDetail(context),
            Container(
              //menu card
              child: Card(
                child: Row(
                  children: [
                    Image.asset('assets/images/test1.jpg',
                        height: 70, width: 90, fit: BoxFit.cover),
                    Spacer(
                      flex: 1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Rice & Curry\nChicken',
                          //textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(29, 67, 138, 1),
                            //fontFamily: 'Montserrat',
                            fontSize: 18,
                            letterSpacing: 0,
                            height: 1.5,
                          ),
                        ),
                        Text(
                          '180 LKR',
                          //textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(29, 67, 138, 1),
                              //fontFamily: 'Montserrat',
                              fontSize: 18,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1.5),
                        )
                      ],
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Stack(
                      children: [
                        Container(
                            width: 97.91498565673828,
                            height: 25.388906478881836,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(13.798317909240723),
                                topRight: Radius.circular(13.798317909240723),
                                bottomLeft: Radius.circular(13.798317909240723),
                                bottomRight:
                                    Radius.circular(13.798317909240723),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(
                                        6.899158954620361, 6.899158954620361),
                                    blurRadius: 6.899158954620361)
                              ],
                              color: Color.fromRGBO(245, 193, 131, 1),
                            )),
                        Positioned(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    num++;
                                  });
                                },
                                icon: Icon(Icons.add),
                              ),
                              Text(
                                '$num', //change this
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(29, 67, 138, 1),
                                    //fontFamily: 'Roboto',
                                    fontSize: 19.317644119262695,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (num > 1) num--;
                                  });
                                },
                                icon: Icon(Icons.remove),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            paymentTotal(context),
          ],
        ),
      ),
    );
  }
}

Widget paymentDetail(context) => Container(
      //card details
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment method',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(45, 12, 87, 1),
                      //fontFamily: 'Work Sans',
                      fontSize: 22,
                      letterSpacing: -0.4099999964237213,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/paymentMethod');
                    },
                    child: Text(
                      'CHANGE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(240, 119, 73, 1),
                          //fontFamily: 'Work Sans',
                          fontSize: 15,
                          letterSpacing: -0.009999999776482582,
                          fontWeight: FontWeight.normal,
                          height: 1.2),
                    )),
              ],
            ),
            Row(
              children: [
                Icon(Icons.credit_card),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '**** **** **** 3269',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(149, 134, 168, 1),
                    //fontFamily: 'Work Sans',
                    fontSize: 17,
                    letterSpacing: -0.4099999964237213,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );

Widget paymentTotal(context) => Container(
      //Total
      padding: const EdgeInsets.all(5.0),
      color: Color.fromRGBO(230, 237, 250, 0.46000000834465027),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    //fontFamily: 'Work Sans',
                    fontSize: 18,
                    letterSpacing: -0.009999999776482582,
                    fontWeight: FontWeight.normal,
                    height: 1.125),
              ),
              Text(
                'LKR 680',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    //fontFamily: 'Work Sans',
                    fontSize: 18,
                    letterSpacing: -0.009999999776482582,
                    fontWeight: FontWeight.normal,
                    height: 1.125),
              ),
            ],
          ),
          default_button(
            bText: "CHECK OUT",
            onPressed: () {
              Navigator.pushNamed(context, '/orderSuccess');
            },
          )
        ],
      ),
    );
