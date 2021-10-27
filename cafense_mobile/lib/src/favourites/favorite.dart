import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafense_mobile/src/menuList/menuCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/rendering.dart';

class favorite extends StatefulWidget {
  const favorite({Key? key}) : super(key: key);

  @override
  _favoriteState createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Favourites').snapshots();

  @override
  Widget build(BuildContext context) {
    var snapshot;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Favourites",
            style: TextStyle(color: Colors.orangeAccent),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: Icon(
                    Icons.shopping_cart,
                    size: 26.0,
                    color: Colors.orange,
                  ),
                )),
          ]),
      body: Column(
        children: [
          /*favcards.isEmpty
              ? Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Your Favourite list is Empty \n Add some from menu",
                    textAlign: TextAlign.center,
                  ))
              : Text('notempty'),*/

          ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
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
    );
  }
}
