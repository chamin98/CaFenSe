import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class menu1 extends StatelessWidget {
  const menu1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/logo1.png'),
          backgroundColor: Color.fromRGBO(255, 237, 222, 1),
          elevation: 0,
        ),
        body: new menu());
  }
}

class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        bottom: true,
        child: GestureDetector(
          onVerticalDragDown: (DragDownDetails dragDownDetails) {
            Navigator.pushNamed(context, '/home');
          },
          child: Container(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                      color: Color.fromRGBO(255, 171, 92, 1),
                      width: 4,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 40.0),
                        child: searchBar()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: menuCard("menuL.png", "Lunch", context)),
                        Expanded(
                            child: menuCard("menuB.png", "Beverages", context))
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child:
                                menuCard("menuS.png", "Fast Foods", context)),
                        Expanded(
                            child: menuCard("menuD.png", "Desert", context)),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget searchBar() => TextFormField(
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
        fillColor: Color.fromRGBO(255, 171, 92, 0.68),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            borderSide:
                BorderSide(color: Color.fromRGBO(231, 112, 16, 1), width: 1)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        hintText: 'Delight yourself!',
        hintStyle: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.4699999988079071),
            fontFamily: 'Poppins',
            fontSize: 22,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1.3),
        prefixIcon: Icon(
          Icons.search,
          color: Color.fromRGBO(0, 0, 0, 0.4699999988079071),
        ),
      ),
    );

Widget menuCard(String img, String name, context) =>
    Stack(alignment: Alignment.center, children: [
      Container(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        width: 170,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(170, 170, 170, 0.05000000074505806),
                offset: Offset(0, 20),
                blurRadius: 20)
          ],
          color: Color.fromRGBO(255, 237, 222, 1),
        ),
      ),
      Column(
        children: [
          Image.asset('assets/images/$img'),
          SizedBox(
            height: 5,
          ),
          Text('$name',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(60, 60, 60, 1),
                  //fontFamily: 'DM Sans',
                  fontSize: 24,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1))
        ],
      )
    ]);
