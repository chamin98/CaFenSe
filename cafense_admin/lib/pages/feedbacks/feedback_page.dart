import 'package:cafense_admin/pages/feedbacks/widgets/feedback_table.dart';
import 'package:cafense_admin/controllers/controllers.dart';
import 'package:cafense_admin/helpers/responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Obx(() => Row(children: [
            Container(
                margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 56 : 8),
                child: Text(menuController.activeItem.value,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)))
          ])),
      SizedBox(height: 15),
      FeedbackTable()
    ]));
  }
}
