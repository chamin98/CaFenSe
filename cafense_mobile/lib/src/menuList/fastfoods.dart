import 'package:cafense_mobile/src/menuList/menuCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

class fastfoods extends StatefulWidget {
  const fastfoods({
    Key? key,
  }) : super(key: key);

  @override
  _fastfoodsState createState() => _fastfoodsState();
}

class _fastfoodsState extends State<fastfoods> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Fast Foods').snapshots();

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
                  elevation: 0,
                  actions: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/checkout');
                          }, // add to cart
                          child: Icon(
                            Icons.shopping_cart,
                            size: 26.0,
                            color: Colors.orange,
                          ),
                        )),
                  ]),
              body: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: [
                        ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              return menuCard(
                                  name: document.id,
                                  image: data['iurl'].toString(),
                                  price: data['price'].toString());
                            }).toList())
                      ]))));
        });
  }
}
