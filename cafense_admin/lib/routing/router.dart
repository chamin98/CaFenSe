import 'package:cafense_admin/pages/feedbacks/feedback_page.dart';
import 'package:cafense_admin/pages/foods/foods_page.dart';
import 'package:cafense_admin/pages/orders/orders_page.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OrdersPageRoute:
      return _getPageRoute(OrdersPage());
    case FoodsPageRoute:
      return _getPageRoute(FoodsPage());
    case FeedbackPageRoute:
      return _getPageRoute(FeedbackPage());
    default:
      return _getPageRoute(OrdersPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
