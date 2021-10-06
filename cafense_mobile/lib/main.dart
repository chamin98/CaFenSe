import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafense_mobile/routes.dart';

<<<<<<< HEAD
void main() {
  runApp(
    MaterialApp(
      initialRoute: '/menu',
=======
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
>>>>>>> fbd33f976250c4c93b198e1ee186c6822e6f1ea3
      routes: routes,
    );
  }
}
