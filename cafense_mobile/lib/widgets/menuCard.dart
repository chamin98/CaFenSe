import 'package:flutter/material.dart';
import 'package:cafense_mobile/widgets/foods.dart';

class MenuCard extends StatelessWidget {
  final breakfast Foods;

  MenuCard({Key? key, required this.Foods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage(Foods.image),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle),
          ),
          Flexible(
            child: Column(
              children: [
                ListTile(
                  title: Text(Foods.name),
                  subtitle: Text(
                    'LKR ${Foods.price}',
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
                      child: menuCard(),
                    ),
                    Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(11, 206, 131, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                          onPressed: () {},
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

class menuCard extends StatefulWidget {
  const menuCard({
    Key? key,
  }) : super(key: key);

  @override
  _menuCardState createState() => _menuCardState();
}

class _menuCardState extends State<menuCard> {
  bool _haspressed = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
          _haspressed = !_haspressed;
        });
      },
    );
  }
}