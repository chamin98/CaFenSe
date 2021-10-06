import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class checkoutCard extends StatefulWidget {
  final String imgName;
  final int price;
  final String dish;

  const checkoutCard({
    Key? key,
    required this.imgName,
    required this.price,
    required this.dish,
  }) : super(key: key);

  @override
  _checkoutCardState createState() => _checkoutCardState();
}

class _checkoutCardState extends State<checkoutCard> {
  int num = 1;

  get imgName => imgName;

  get dish => dish;

  get price => price;

  @override
  Widget build(BuildContext context) {
    return
        //menu card
        Card(
      child: Row(
        children: [
          Image.asset('assets/images/$imgName',
              height: 70, width: 90, fit: BoxFit.cover),
          Spacer(
            flex: 1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '$dish',
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
                '$price LKR',
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
                      bottomRight: Radius.circular(13.798317909240723),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(6.899158954620361, 6.899158954620361),
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
    );
  }
}
