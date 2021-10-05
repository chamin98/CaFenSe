import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';
import 'extra.dart';

AlertDialog ForgetPassword() {
  return AlertDialog(
      content: SingleChildScrollView(
          child: Container(
              height: 300.0,
              width: 400.0,
              child: Column(children: [
                Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 25.0),
                Text(
                    "Please enter your email and we will send you a link to return to your account",
                    textAlign: TextAlign.center),
                SizedBox(height: 10.0),
                ForgotPassForm(),
                SizedBox(height: 10.0),
              ]))));
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(EmailNullError)) {
                setState(() {
                  errors.remove(EmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(InvalidEmailError)) {
                setState(() {
                  errors.remove(InvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(EmailNullError)) {
                setState(() {
                  errors.add(EmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(InvalidEmailError)) {
                setState(() {
                  errors.add(InvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              icon: Icon(Icons.mail),
            ),
          ),
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
            child: Text('Continue'),
          )
        ]));
  }
}
