import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafense_mobile/src/login.dart';
import 'package:cafense_mobile/src/signup.dart';
import 'package:cafense_mobile/src/home.dart';
import 'package:cafense_mobile/src/menu.dart';
import 'package:cafense_mobile/src/orderSuccess.dart';
import 'package:cafense_mobile/src/orderFail.dart';


void main(){
  runApp(MaterialApp(
    initialRoute: '/orderSuccess',
    routes: {
      '/login':(context) => login(),
      '/signup':(context) => signup(),
      '/home':(context) => home(),
      '/menu': (context) => menu(),
  '/orderSuccess':(context) => orderSuccess(),
  '/orderFail':(context) => orderFail(),


    },
  ),
  );
}