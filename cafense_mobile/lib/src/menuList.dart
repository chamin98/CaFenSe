import 'package:cafense_mobile/services/databaseServices.dart';
import 'package:cafense_mobile/widgets/menuCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafense_mobile/widgets/foods.dart';

import 'package:provider/provider.dart';

class menuList extends StatefulWidget {
  const menuList({Key? key}) : super(key: key);

  @override
  _menuListState createState() => _menuListState();
}

class _menuListState extends State<menuList> {
//Stream documentStream = FirebaseFirestore.instance.collection('Lunch').doc('doc.id').snapshots();

  /*List<menuList_card> dishes = [
    menuList_card(dishname: "Fried Rice", price: "150", img: ""),
  ];*/

  @override
  Widget build(BuildContext context) {
    final breakfastDishes = Provider?.of<List<breakfast>?>(context);
    return StreamProvider<List<breakfast>>.value(
        initialData: [],
        value: databaseServices(uid: 'uid').brekfast,
        builder: (context, snapshot) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    //Container(child: menuSearch()),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: breakfastDishes?.length,
                      itemBuilder: (context, index) {
                        // ignore: unnecessary_null_comparison
                        if (breakfastDishes == null) {
                          return Container();
                        } else
                          return MenuCard(Foods: breakfastDishes[index]);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  /* Widget menuSearch() => TextFormField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.4699999988079071),
            //fontFamily: 'Poppins',
            fontSize: 22,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1.3),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(255, 171, 92, 0.4),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide:
                  BorderSide(color: Color.fromRGBO(231, 112, 16, 1), width: 1)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          hintText: 'Delight yourself!',
          hintStyle: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.47),
              //fontFamily: 'Poppins',
              fontSize: 22,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1.3),
          prefixIcon: Icon(
            Icons.search,
            color: Color.fromRGBO(0, 0, 0, 0.47),
          ),
        ),
      );*/
}
