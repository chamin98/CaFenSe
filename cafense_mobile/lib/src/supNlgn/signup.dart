import 'package:flutter/material.dart';

import '../constants.dart';
import 'extra.dart';

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

class SigninForm extends StatefulWidget {
  @override
  _SigninFormState createState() => _SigninFormState();
}

bool vissibility = false;

class _SigninFormState extends State<SigninForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? uname;
  final List<String?> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          namefield(),
          SizedBox(height: 10),
          emailfield(),
          SizedBox(height: 10),
          pwrdfield(),
          SizedBox(height: 10),
          FormError(errors: errors),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xfff07749),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Do what you want to do
              }
            },
            child: Text('Signup'),
          ),
        ]));
  }

  TextFormField namefield() {
    return TextFormField(
        keyboardType: TextInputType.name,
        onSaved: (newValue) => uname = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: NamelNullError);
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Username",
          hintText: "Enter an Username",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 22),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Colors.black45),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: Colors.black45),
              gapPadding: 10),
        ));
  }

  TextFormField emailfield() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: EmailNullError);
          } else if (emailValidatorRegExp.hasMatch(value)) {
            removeError(error: InvalidEmailError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: EmailNullError);
            return "";
          } else if (!emailValidatorRegExp.hasMatch(value)) {
            addError(error: InvalidEmailError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter Your Email",
          suffixIcon: Icon(Icons.mail_outline_rounded),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 22),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Colors.black45),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: Colors.black45),
              gapPadding: 10),
        ));
  }

  TextFormField pwrdfield() {
    return TextFormField(
        obscureText: !vissibility,
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: PassNullError);
          } else if (value.length >= 8) {
            removeError(error: ShortPassError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: PassNullError);
            return "";
          } else if (value.length < 8) {
            addError(error: ShortPassError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter Your Password",
          suffixIcon: IconButton(
            icon: Icon(vissibility ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                vissibility = !vissibility;
              });
            },
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 22),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: Colors.black45),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: Colors.black45),
              gapPadding: 10),
        ));
  }

// Error Operations
  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
}
