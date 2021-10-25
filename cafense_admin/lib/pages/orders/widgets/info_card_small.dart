import 'package:flutter/material.dart';

class InfoCardSmall extends StatelessWidget {
  final String title;
  final String value;

  const InfoCardSmall({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.withOpacity(.1), width: 1),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Color(0xffa4a6b3))),
                  Text(value,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffa4a6b3)))
                ])));
  }
}
