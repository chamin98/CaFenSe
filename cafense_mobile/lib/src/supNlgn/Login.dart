import 'package:cafense_mobile/src/supNlgn/signup.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'ForgetPassowrd.dart';

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

//Login Form

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

bool vissibility = false;

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            emailfield(),
            SizedBox(
              height: 10,
            ),
            pwrdfield(),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: Color(0xffda3b0e),
                  onChanged: (value) {
                    setState(() {
                      remember = value;
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
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                        color: Color(0xffda3b0e),
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xfff07749),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // if all are valid then go to success screen
                } else {
                  for (final item in errors) {
                    final snackBar = SnackBar(
                      content: Text(item!),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              },
              child: Text('Login'),
            ),
          ],
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
