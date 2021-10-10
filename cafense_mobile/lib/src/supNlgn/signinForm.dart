import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../constants.dart';
import 'authentication.dart';
import 'extra.dart';

class SigninForm extends StatefulWidget {
  @override
  _SigninFormState createState() => _SigninFormState();
}

bool vissibility = false;

class _SigninFormState extends State<SigninForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String uname;
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
                context
                    .read<Authentication>()
                    .signUp(uname: uname, email: email, password: password);
                Navigator.pop(context);
              }
            },
            child: Text('Signup'),
          ),
        ]));
  }

  TextFormField namefield() {
    return TextFormField(
        keyboardType: TextInputType.name,
        onSaved: (newValue) => uname = newValue!,
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
        onSaved: (newValue) => email = newValue!,
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
        onSaved: (newValue) => password = newValue!,
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
