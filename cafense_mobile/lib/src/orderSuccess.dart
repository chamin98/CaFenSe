import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafense_mobile/widgets/button1.dart';

class orderSuccess extends StatefulWidget {
  const orderSuccess({Key? key}) : super(key: key);

  @override
  _orderSuccessState createState() => _orderSuccessState();
}

class _orderSuccessState extends State<orderSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Center(
            child: Column(children: [
              Padding(
                //correct symbol area
                padding: const EdgeInsets.only(top: 120.0),
                child: Image.asset('assets/images/correctsymbol.png'),
              ),
              SizedBox(
                height: 16.0,
              ),

              Text(
                'Order Successful! ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  letterSpacing: 1.0,
                  color: Colors.green[600],
                  fontWeight: FontWeight.w700,
                ),
              ),

              //SizedBox(height: 55.0,),
              Spacer(
                flex: 1,
              ),
              Card(//for order information

                  ),

              //SizedBox(height: 89.0,),
              Spacer(
                flex: 2,
              ),
              Text(
                'You can Pick Your Order From Cafeteria',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: Colors.brown[900]),
              ),
              //SizedBox(height: 35.0,),
              Spacer(
                flex: 1,
              ),

              SizedBox(
                height: 56.0,
                width: 374.0,
                child: default_button(
                  bText: " ADD MORE",
                  onPressed: () {
                    Navigator.pushNamed(context, '/orderSuccess');
                  },
                ),
              )
            ]),
          ),
        ));
  }
}
