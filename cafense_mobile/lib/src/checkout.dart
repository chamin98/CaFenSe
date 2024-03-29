import 'package:cafense_mobile/src/menuList/menuCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafense_mobile/widgets/button1.dart';
import 'package:fluttertoast/fluttertoast.dart';

class checkOut extends StatefulWidget {
  const checkOut({Key? key}) : super(key: key);

  @override
  _checkOutState createState() => _checkOutState();
}

class _checkOutState extends State<checkOut> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Checkout').snapshots();

  int num = 1;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            Fluttertoast.showToast(
                timeInSecForIosWeb: 30, msg: 'Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          }
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  "Cart",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                actions: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/addcard');
                        }, // add to cart
                        child: Icon(
                          Icons.credit_card_sharp,
                          size: 26.0,
                          color: Colors.orange,
                        ),
                      )),
                ]),
            body: SingleChildScrollView(
              child: SafeArea(
                top: true,
                left: true,
                right: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    paymentDetail(context),
                    ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;

                          //menucard
                          return menuCard(
                              name: document.id,
                              price: data['price'].toString(),
                              image: data['iurl'].toString());
                        }).toList())
                  ],
                ),
              ),
            ),
            bottomNavigationBar: paymentTotal(context),
          );
        });
  }
}

Widget paymentDetail(context) => Container(
      //payment detail widget @ 1st row
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
                  'Cash',
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
      //payment total @ bottom
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
                'LKR',
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
