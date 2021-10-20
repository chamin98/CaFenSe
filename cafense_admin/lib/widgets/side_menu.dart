import 'package:cafense_admin/controllers/controllers.dart';
import 'package:cafense_admin/helpers/responsiveness.dart';
import 'package:cafense_admin/routing/routes.dart';
import 'package:cafense_admin/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: Color(0xff363740),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(mainAxisSize: MainAxisSize.min, children: [
              const SizedBox(height: 40),
              Row(children: [
                SizedBox(width: _width / 48),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset(
                    "assets/logo.png",
                    scale: 2,
                  ),
                ),
                const Flexible(
                    child: Text(
                  "Dashboard",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffa4a6b3)),
                )),
                SizedBox(width: _width / 48),
              ]),
            ])
          else if (ResponsiveWidget.isMediumScreen(context))
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Image.asset(
                      'assets/logo.png',
                      scale: 2,
                    )),
                const Text("Caffense",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFA4A6B3),
                        fontWeight: FontWeight.bold))
              ],
            )
          else
            Row(children: [
              Image.asset(
                'assets/logo.png',
                scale: 2,
              ),
              const Text("Caffense",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFA4A6B3),
                      fontWeight: FontWeight.bold))
            ]),
          Divider(color: Colors.white.withOpacity(.1)),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItemRoutes
                .map((item) => SideMenuItem(
                    itemName: item.name,
                    onTap: () {
                      {
                        if (item.route == authenticationPageRoute) {
                          Get.offAllNamed(authenticationPageRoute);
                          menuController
                              .changeActiveItemTo(OrdersPageRouteName);
                        }
                        if (!menuController.isActive(item.name)) {
                          menuController.changeActiveItemTo(item.name);
                          if (ResponsiveWidget.isSmallScreen(context)) {
                            Get.back();
                          }
                          navigationController.navigateTo(item.route);
                        }
                      }
                    }))
                .toList(),
          )
        ],
      ),
    );
  }
}
