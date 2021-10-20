import 'package:cafense_mobile/src/supNlgn/authservices.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'ForgetPassowrd.dart';

class Login extends StatefulWidget {
  final Function? toggleScreen;

  const Login({Key? key, this.toggleScreen}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _emailController;
  TextEditingController? _passwordController;

  bool remember = false;
  bool vissibility = false;

  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Center(child: Text("Log In")),
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
                        form(),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text("Don't have an account?",
                                style: TextStyle(color: Color(0xffda3b0e))),
                            TextButton(
                              onPressed: () => widget.toggleScreen!(),
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

  Form form() {
    final loginProvider = Provider.of<Authservices>(context);
    return Form(
        key: _formKey,
        child: Column(children: [
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
                  }),
              Text("Remember me", style: TextStyle(color: Color(0xffda3b0e))),
              Spacer(),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return forgetPassword();
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
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                print("Email: ${_emailController!.text}");
                print("Email: ${_passwordController!.text}");
                await loginProvider.logIn(_emailController!.text.trim(),
                    _passwordController!.text.trim());
              }
            },
            child: loginProvider.isLoading
                ? CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white))
                : Text('Login'),
          ),
          SizedBox(height: 10),
          if (loginProvider.errorMessage != null)
            Container(
                color: Colors.amberAccent,
                child: ListTile(
                    title: Text(loginProvider.errorMessage!),
                    leading: Icon(Icons.error),
                    trailing: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => loginProvider.setMessage(null),
                    )))
        ]));
  }

  TextFormField emailfield() {
    return TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) =>
            value!.isNotEmpty ? null : "Please Enter your email",
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
        validator: (value) =>
            value!.length < 6 ? "Password is too short" : null,
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
