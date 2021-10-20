import 'package:cafense_admin/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = OrdersPageRouteName.obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case OrdersPageRouteName:
        return _customIcon(Icons.pie_chart, itemName);
      case FoodsPageRouteName:
        return _customIcon(Icons.food_bank_rounded, itemName);
      case FeedbackPageRouteName:
        return _customIcon(Icons.feedback, itemName);
      case authenticationPageRouteName:
        return _customIcon(Icons.logout, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) {
      return Icon(icon, size: 22, color: const Color(0xffdde2ff));
    }

    return Icon(
      icon,
      color: isHovering(itemName) ? const Color(0xffdde2ff) : const Color(0xffa4a6b3),
    );
  }
}
