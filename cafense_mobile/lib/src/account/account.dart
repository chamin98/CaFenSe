import 'package:cafense_mobile/services/authservices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'editaccdetails.dart';

class account extends StatefulWidget {
  const account({Key? key}) : super(key: key);

  @override
  _accountState createState() => _accountState();
}

class _accountState extends State<account> {
  Widget build(BuildContext context) {
    final authservice = Provider.of<Authservices>(context);
    final user = Provider.of<User?>(context);
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
                        backgroundImage: user!.photoURL != null
                            ? NetworkImage(user.photoURL!)
                            : AssetImage('assets/images/menuD.png')
                                as ImageProvider,
                        backgroundColor: Colors.transparent,
                      ),
                      Text(user.displayName!, style: TextStyle(fontSize: 18)),
                      Text(user.email!,
                          style: TextStyle(fontSize: 15, color: Colors.grey))
                    ],
                  ),
                ),
              ),
              accSettings("Change Account Details",
                  () => {showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return editAccDetails();
                        })}),
              accSettings(
                "Your Orders",
                () => {Navigator.pushNamed(context, '/lunch')},
              ),
              accSettings("Feedbacks", () => null),
              accSettings("Logout", () => authservice.signout())
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
