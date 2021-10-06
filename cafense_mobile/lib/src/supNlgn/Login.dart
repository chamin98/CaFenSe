import 'package:cafense_mobile/src/supNlgn/signup.dart';
import 'package:flutter/material.dart';

import 'LoginForm.dart';

class Login extends StatelessWidget {
  static String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Center(
            child: Text(
              "Log In",
            ),
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
                          backgroundImage: AssetImage("assets/logo_size_w.jpg"),
                        ),
                        Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Color(0xfff3764a),
                            fontSize: 36,
                            fontFamily: "Work Sans",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Opacity(
                          opacity: 0.60,
                          child: Text("Please login to your account.",
                              style: TextStyle(
                                  color: Color(0xfff3764a),
                                  fontSize: 18,
                                  fontFamily: "Work Sans",
                                  fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(height: 5),
                        LoginForm(),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text("Don't have an account?",
                                style: TextStyle(color: Color(0xffda3b0e))),
                            TextButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, Signup.routeName),
                              child: Text(
                                "Create new one!",
                                style: TextStyle(
                                    color: Color(0xffda3b0e),
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ]))))),
      backgroundColor: Color(0xffffedde),
    );
  }
}
