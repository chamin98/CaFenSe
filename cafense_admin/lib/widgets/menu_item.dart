import 'package:cafense_admin/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap;
  const HorizontalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: onTap,
        onHover: (value) {
          value
              ? menuController.onHover(itemName)
              : menuController.onHover("not hovering");
        },
        child: Obx(() => Container(
              color: menuController.isHovering(itemName)
                  ? Color(0xFFA4A6B3).withOpacity(.1)
                  : Colors.transparent,
              child: Row(
                children: [
                  Visibility(
                      visible: menuController.isHovering(itemName) ||
                          menuController.isActive(itemName),
                      child:
                          Container(width: 6, height: 40, color: Colors.black),
                      maintainSize: true,
                      maintainState: true,
                      maintainAnimation: true),
                  SizedBox(width: _width / 1000),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: menuController.returnIconFor(itemName)),
                  if (!menuController.isActive(itemName))
                    Flexible(
                        child: Text(itemName,
                            style: TextStyle(
                                color: menuController.isHovering(itemName)
                                    ? Colors.black
                                    : Color(0xFFA4A6B3))))
                  else
                    Flexible(
                        child: Text(itemName,
                            style: TextStyle(
                                color: Color(0xFFA4A6B3),
                                fontSize: 18,
                                fontWeight: FontWeight.bold)))
                ],
              ),
            )));
  }
}

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap;
  const VerticalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        onHover: (value) {
          value
              ? menuController.onHover(itemName)
              : menuController.onHover("not hovering");
        },
        child: Obx(() => Container(
            color: menuController.isHovering(itemName)
                ? Color(0xFFA4A6B3).withOpacity(.1)
                : Colors.transparent,
            child: Row(children: [
              Visibility(
                  visible: menuController.isHovering(itemName) ||
                      menuController.isActive(itemName),
                  child: Container(width: 3, height: 72, color: Colors.white),
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true),
              Expanded(
                  child: Container(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                    padding: EdgeInsets.all(16),
                    child: menuController.returnIconFor(itemName)),
                if (!menuController.isActive(itemName))
                  Flexible(
                      child: Text(itemName,
                          style: TextStyle(
                              color: menuController.isHovering(itemName)
                                  ? Colors.black
                                  : Color(0xFFA4A6B3))))
                else
                  Flexible(
                      child: Text(itemName,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)))
              ])))
            ]))));
  }
}
