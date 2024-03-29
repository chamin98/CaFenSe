import 'package:cafense_mobile/src/menu.dart';
import 'package:cafense_mobile/src/menuList/bevarages.dart';
import 'package:cafense_mobile/src/menuList/breakfast.dart';
import 'package:cafense_mobile/src/menuList/desserts.dart';
import 'package:cafense_mobile/src/menuList/fastfoods.dart';
import 'package:cafense_mobile/src/menuList/lunch.dart';

import 'package:flutter/widgets.dart';
import 'package:cafense_mobile/src/home.dart';

import 'package:cafense_mobile/src/orderSuccess.dart';
import 'package:cafense_mobile/src/orderFail.dart';
import 'package:cafense_mobile/src/checkout.dart';
import 'package:cafense_mobile/src/addcard.dart';
import 'package:cafense_mobile/src/paymentMethod.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (context) => home(),
  '/menu': (context) => menu(),
  '/lunch': (context) => lunch(),
  '/breakfast': (context) => breakfast(),
  '/fastfoods': (context) => fastfoods(),
  '/desserts': (context) => desserts(),
  '/beverages': (context) => beverages(),
  '/checkout': (context) => checkOut(),
  '/paymentMethod': (context) => paymentMethod(),
  '/addcard': (context) => addCard(),
  '/orderSuccess': (context) => orderSuccess(),
  '/orderFail': (context) => orderFail(),
};
