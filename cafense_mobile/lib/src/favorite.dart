import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class favorite extends StatefulWidget {
  const favorite({Key? key}) : super(key: key);

  @override
  _favoriteState createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  List favcards = [];

  @override
  Widget build(BuildContext context) {
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
                  onTap: () {},
                  child: Icon(
                    Icons.shopping_cart,
                    size: 26.0,
                    color: Colors.orange,
                  ),
                )),
          ]),
      body: Column(
        children: [
          favcards.isEmpty
              ? Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Your Favourite list is Empty \n Add some from menu",
                    textAlign: TextAlign.center,
                  ))
              : Text('notempty')
        ],
      ),
    );
  }
}
