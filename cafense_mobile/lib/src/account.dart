import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class account extends StatefulWidget {
  const account({Key? key}) : super(key: key);

  @override
  _accountState createState() => _accountState();
}

class _accountState extends State<account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Account Settings",
          style: TextStyle(fontSize: 28, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: true,
          right: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 250,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 80.0,
                        backgroundImage: AssetImage('assets/images/menuD.png'),
                        backgroundColor: Colors.transparent,
                      ),
                      Text(
                        "Sam Smith",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Email@none.com",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
              accSettings("Change Account Details",
                  () => {Navigator.pushNamed(context, '/home')}),
              accSettings(
                "Your Orders",
                () => {Navigator.pushNamed(context, '/home')},
              ),
              accSettings("Feedbacks", () => null),
              accSettings("Logout", () => null),
            ],
          ),
        ),
      ),
    );
  }
}

Widget accSettings(String name, _onPressed()) => Container(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: _onPressed,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(245, 182, 123, 1)),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$name'),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
