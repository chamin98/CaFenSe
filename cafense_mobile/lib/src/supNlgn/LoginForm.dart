import 'package:cafense_mobile/src/supNlgn/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../constants.dart';
import 'ForgetPassowrd.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

bool vissibility = false;

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late String email;
  late String password;
  bool remember = false;
  final List<String?> errors = [];

  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            emailfield(),
            SizedBox(height: 10),
            pwrdfield(),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: Color(0xffda3b0e),
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  },
                ),
                Text("Remember me", style: TextStyle(color: Color(0xffda3b0e))),
                Spacer(),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ForgetPassword();
                          });
                    },
                    child: Text("Forgot Password",
                        style: TextStyle(
                            color: Color(0xffda3b0e),
                            decoration: TextDecoration.underline)))
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xfff07749),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print("Email: ${_emailController.text}");
                  print("Email: ${_passwordController.text}");
                  _formKey.currentState!.save();
                  context
                      .read<Authentication>()
                      .logIn(email: email, password: password);
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            /*if (errors != null)
              for (final item in errors)
                Container(
                  color: Colors.amberAccent,
                  child: ListTile(
                    title: Text(item!),
                    leading: Icon(Icons.error),
                    trailing: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: (){}},
                    ),
                  ),
                )*/
          ],
        ));
  }

  TextFormField emailfield() {
    return TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue!,
        validator: (value) => value!.isEmpty ? null : EmailNullError,
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter Your Email",
          prefixIcon: Icon(Icons.mail_outline_rounded),
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
        controller: _passwordController,
        obscureText: !vissibility,
        onSaved: (newValue) => password = newValue!,
        validator: (value) => value!.length < 8 ? ShortPassError : null,
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter Your Password",
          prefixIcon: Icon(Icons.vpn_key),
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
}
