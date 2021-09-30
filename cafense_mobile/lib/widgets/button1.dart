import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class button1 extends StatefulWidget {
  final String bText;
  final Function onPressed;

  button1({required this.bText, required this.onPressed});

  @override
  _button1State createState() => _button1State();
}

class _button1State extends State<button1> {
  get onPressed => null;

  get bText => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        color: Color.fromRGBO(240, 119, 73, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: onPressed,
        child: Text(
          ''
          '$bText',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}