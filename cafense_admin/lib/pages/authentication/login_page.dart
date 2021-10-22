import 'package:cafense_admin/helpers/responsiveness.dart';
import 'package:cafense_admin/pages/authentication/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Container(
                padding: EdgeInsets.all(10),
                child: Row(children: [
                  Image.asset("assets/full_logo.png", scale: 2),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text("About",
                          style: TextStyle(color: Colors.black))),
                  TextButton(
                      onPressed: () {},
                      child: const Text("Contact us",
                          style: TextStyle(color: Colors.black)))
                ]))),
        body: ResponsiveWidget.isLargeScreen(context)
            ? Stack(children: [
                Positioned(
                    bottom: -(MediaQuery.of(context).size.width / 8),
                    left: -(MediaQuery.of(context).size.height / 8),
                    child: ClipOval(
                        child: Container(padding: EdgeInsets.zero,
                            width: MediaQuery.of(context).size.width * 7 / 8,
                            height: MediaQuery.of(context).size.height * 19 / 20,
                            color: Color(0xffffedde)))),
                Row(children: [
                  Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Center(child: LoginForm())),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        const Text("Welcome To",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        Image.asset("assets/full_logo.png")
                      ]))
                ])
              ])
            : Center(child: LoginForm()));
  }
}
