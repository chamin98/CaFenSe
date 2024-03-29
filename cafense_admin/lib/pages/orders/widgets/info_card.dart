import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color? topColor;

  const InfoCard(
      {Key? key, required this.title, required this.value, this.topColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isActive = false;
    return Expanded(
        child: InkWell(
            onHover: (value) => isActive = !isActive,
            child: Container(
                height: 136,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 6),
                        color: Colors.grey.withOpacity(.1),
                        blurRadius: 12)
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        color: topColor ?? Color(0xffffab5c),
                        height: 5,
                      ))
                    ],
                  ),
                  const Spacer(),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "$title\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: isActive
                                    ? Color(0xffffab5c)
                                    : Color(0xffa4a6b3))),
                        TextSpan(
                            text: "$value",
                            style: TextStyle(
                                fontSize: 40,
                                color: isActive
                                    ? Color(0xffffab5c)
                                    : Color(0xffdde2ff))),
                      ])),
                  const Spacer(),
                ]))));
  }
}
