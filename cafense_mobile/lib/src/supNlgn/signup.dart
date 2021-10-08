import 'package:flutter/material.dart';

import 'signinForm.dart';

class Signup extends StatelessWidget {
  static String routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text("Create New Account"),
            ),
            elevation: 0,
            backgroundColor: Color(0xffffab5c)),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Center(
                    child: SizedBox(
                        width: 375.0,
                        child: Column(children: [
                          Padding(padding: new EdgeInsets.all(25.0)),
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 75,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage("assets/logo_size_w.jpg"),
                          ),
                          Text(
                            "Signup",
                            style: TextStyle(
                              color: Color(0xfff3764a),
                              fontSize: 36,
                              fontFamily: "Work Sans",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Opacity(
                            opacity: 0.60,
                            child: Text("Create New Account.",
                                style: TextStyle(
                                    color: Color(0xfff3764a),
                                    fontSize: 18,
                                    fontFamily: "Work Sans",
                                    fontWeight: FontWeight.w600)),
                          ),
                          SizedBox(height: 5),
                          SigninForm(),
                          Row(
                            children: [
                              Text("Have an account?",
                                  style: TextStyle(color: Color(0xffda3b0e))),
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Color(0xffda3b0e),
                                        decoration: TextDecoration.underline),
                                  ))
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          )
                        ]))))),
        backgroundColor: Color(0xffffedde));
  }
}
