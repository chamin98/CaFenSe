import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body:Column(
        children: [
          Padding(  //correct symbol area
             padding: const EdgeInsets.fromLTRB(117.0, 127.0, 117.0, 0.0),
             child: Image.asset('assets/images/correctsymbol.png'),
          ),
          SizedBox(height: 16.0,),

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

          SizedBox(height: 55.0,),

          Card(  //for order information

          ),

          SizedBox(height: 89.0,),
          
          Text(
            'You can Pick Your Order From Cafeteria',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.brown[900]
            ),


          ),
          SizedBox(height: 55.0,),

          SizedBox(
            height: 56.0,
            width: 374.0,

            child: FlatButton(
                color : Color.fromRGBO(240, 119, 73, 1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),

                onPressed: (){
                  Navigator.pushNamed(context, '/menu');
                },
                child:Text(''
                    'Add More',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,

                  ),
                )
            ),
          )





    ]
              )
          );





  }
}

