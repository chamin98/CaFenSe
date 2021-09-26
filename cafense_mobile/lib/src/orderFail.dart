import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class orderFail extends StatefulWidget {
  const orderFail({Key? key}) : super(key: key);

  @override
  _orderFailState createState() => _orderFailState();
}

class _orderFailState extends State<orderFail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.baseline,
           children: [

               Padding(  //correct symbol area
                 padding: const EdgeInsets.only(top: 120.0),
                 child: Image.asset('assets/images/crosssymbol.png'),
               ),


             SizedBox(height: 32.0,),

             Expanded(
               flex:1,
               child: Text(
                   'OOPS....',
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   color: Color(0xffd62222),
                   fontSize: 28,

                   fontWeight: FontWeight.w600,
                   letterSpacing: 1,
                 ),
               ),
             ),

             SizedBox(height: 118.0,),

             Expanded(
               flex: 1,
               child: Text(
                 "Your Order is Unsuccessful\n",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   color: Color(0xff4f3f3a),
                   fontSize: 24,

                   fontWeight: FontWeight.w500,
                 ),
               ),
             ),

             SizedBox(height: 80.0,),

             SizedBox(
               height: 56.0,
               width: 374.0,

               child: FlatButton(
                   color : Color.fromRGBO(240, 119, 73, 1),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),

                   onPressed: (){
                     Navigator.pushNamed(context, '/checkout');
                   },
                   child:Text(''
                       'TRY AGAIN',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                       color: Colors.white,

                     ),
                   )
               ),
             )


           ],

          ),
        ),
      )
    );
  }
}
