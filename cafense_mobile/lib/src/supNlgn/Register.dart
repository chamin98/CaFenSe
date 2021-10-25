import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/authservices.dart';

class Register extends StatefulWidget {
  final Function? toggleScreen;
  const Register({Key? key, this.toggleScreen}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  TextEditingController? _usernameController;

  bool remember = false;
  bool vissibility = false;

  void initState() {
    _usernameController = TextEditingController();

    _emailController = TextEditingController();

    _passwordController = TextEditingController();

    super.initState();
  }

  void dispose() {
    _usernameController!.dispose();
    _emailController!.dispose();
    _passwordController!.dispose();
    super.dispose();
  }

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
                          form(),
                          Row(
                            children: [
                              Text("Have an account?",
                                  style: TextStyle(color: Color(0xffda3b0e))),
                              TextButton(
                                  onPressed: () => widget.toggleScreen!(),
                                  child: Text("Login",
                                      style: TextStyle(
                                          color: Color(0xffda3b0e),
                                          decoration:
                                              TextDecoration.underline)))
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          )
                        ]))))),
        backgroundColor: Color(0xffffedde));
  }

  Form form() {
    final loginProvider = Provider.of<Authservices>(context);
    return Form(
        key: _formKey,
        child: Column(children: [
          namefield(),
          SizedBox(height: 10),
          emailfield(),
          SizedBox(height: 10),
          pwrdfield(),
          SizedBox(height: 10),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xfff07749),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  print("Email: ${_emailController!.text}");
                  print("Email: ${_passwordController!.text}");
                  await loginProvider.register(
                      _usernameController!.text.trim(),
                      _emailController!.text.trim(),
                      _passwordController!.text.trim());
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                              title: const Text('Verification Send'),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () => widget.toggleScreen!(),
                                    child: const Text('OK',
                                        style: TextStyle(
                                            color: Color(0xffda3b0e))))
                              ]));
                }
              },
              child: loginProvider.isLoading
                  ? CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.white))
                  : Text('Signup'))
        ]));
  }

  TextFormField namefield() {
    return TextFormField(
        controller: _usernameController,
        keyboardType: TextInputType.name,
        validator: (value) =>
            value!.isNotEmpty ? null : "Please Enter your Username",
        decoration: InputDecoration(
            labelText: "Username",
            hintText: "Enter an Username",
            prefixIcon: Icon(Icons.emoji_emotions),
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
                gapPadding: 10)));
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
                gapPadding: 10)));
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
              }),
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
