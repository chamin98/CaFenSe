import 'package:flutter/widgets.dart';
import 'package:cafense_mobile/src/login.dart';
import 'package:cafense_mobile/src/signup.dart';
import 'package:cafense_mobile/src/home.dart';
import 'package:cafense_mobile/src/menu.dart';
import 'package:cafense_mobile/src/orderSuccess.dart';
import 'package:cafense_mobile/src/orderFail.dart';
import 'package:cafense_mobile/src/checkout.dart';
import 'package:cafense_mobile/src/addcard.dart';
import 'package:cafense_mobile/src/paymentMethod.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (context) => login(),
  '/signup': (context) => signup(),
  '/home': (context) => home(),
  '/menu': (context) => menu(),
  '/checkout': (context) => checkOut(),
  '/paymentMethod': (context) => paymentMethod(),
  '/addcard': (context) => addCard(),
  '/orderSuccess': (context) => orderSuccess(),
  '/orderFail': (context) => orderFail(),
};
