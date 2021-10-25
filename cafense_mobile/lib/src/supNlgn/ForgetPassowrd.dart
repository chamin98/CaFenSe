import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/authservices.dart';

AlertDialog forgetPassword() {
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
  late TextEditingController _emailController;

  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<Authservices>(context);
    return Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) =>
                  value!.isNotEmpty ? null : "Please Enter your email",
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  icon: Icon(Icons.mail))),
          SizedBox(height: 10),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xfff07749),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await loginProvider.resetPwrd(
                      email: _emailController.text.trim());
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text('Verification Send'),
                            content: const Text('Please check your emails'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  'OK',
                                  style: TextStyle(color: Color(0xffda3b0e)),
                                ),
                              ),
                            ],
                          ));
                }
              },
              child: Text('Continue'))
        ]));
  }
}
