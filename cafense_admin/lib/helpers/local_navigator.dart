import 'package:cafense_admin/controllers/controllers.dart';
import 'package:cafense_admin/routing/router.dart';
import 'package:cafense_admin/routing/routes.dart';
import 'package:flutter/cupertino.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: OrdersPageRoute,
    );
