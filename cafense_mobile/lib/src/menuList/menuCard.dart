import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class menuCard extends StatefulWidget {
  final String name;
  final String price;
  final String image;

  menuCard(
      {Key? key, required this.name, required this.image, required this.price})
      : super(key: key);

  @override
  _menuCardState createState() => _menuCardState();
}

class _menuCardState extends State<menuCard> {
  bool _haspressed = false;
  @override
  Widget build(BuildContext context) {
    CollectionReference favourites =
        FirebaseFirestore.instance.collection('Favourites');

    CollectionReference cart =
        FirebaseFirestore.instance.collection('Checkout');

    Future<void> addFavourites() {
      return favourites
          .doc(widget.name)
          .set({'price': widget.price, 'iurl': widget.image})
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    Future<void> addCheckout() async {
      // Call the user's CollectionReference to add a new user
      return cart
          .doc(widget.name)
          .set({'price': widget.price, 'iurl': widget.image})
          .then((value) => print("Added to cart"))
          .catchError((error) => print("Failed to add: $error"));
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: widget.image != null
                      ? NetworkImage(widget.image)
                      : AssetImage('assets/images/user_default.jpg')
                          as ImageProvider,
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle),
          ),
          Flexible(
            child: Column(
              children: [
                ListTile(
                  title: Text(widget.name),
                  subtitle: Text(
                    'LKR ' + widget.price,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  children: [
                    Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromRGBO(216, 208, 227, 1),
                          width: 1,
                        ),
                      ),
                      child: IconButton(
                        icon: _haspressed
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border_outlined,
                                color: Color.fromRGBO(149, 134, 168, 1),
                              ),
                        onPressed: () {
                          setState(() {
                            //add to favourite
                            _haspressed = !_haspressed;
                          });
                          addFavourites();
                        },
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(11, 206, 131, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                          onPressed: addCheckout, //add to cart
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
