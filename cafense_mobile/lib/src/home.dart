import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'supNlgn/authservices.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xfff07749),
            ),
            onPressed: () {
              //context.read<Authentication>().signout();
            },
            child: Text('Logout'),
          ),
        ));
  }
}
