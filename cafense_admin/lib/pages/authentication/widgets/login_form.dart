import 'package:cafense_admin/pages/authentication/widgets/authservices.dart';
import 'package:cafense_admin/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends GetWidget<Authservices> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Center(
              child: SizedBox(
                  width: 375.0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(padding: EdgeInsets.all(25.0)),
                        const SizedBox(height: 10),
                        const Text("LOGIN",
                            style: TextStyle(
                                fontSize: 36, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 15),
                        form(),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Text("Do not have admin credentials? ",
                                style: TextStyle(color: Color(0xffda3b0e))),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Request Credentials!!",
                                style: TextStyle(
                                    color: Color(0xffda3b0e),
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ])))),
    );
  }

  Form form() {
    return Form(
        key: _formKey,
        child: Column(children: [
          emailfield(),
          const SizedBox(height: 10),
          pwrdfield(),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xfff07749),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {               
                controller.logIn(_emailController!.text.trim(),
                    _passwordController!.text.trim());
                Get.offAllNamed(rootRoute);
              }
            },
            child: const Text('Login'),
          ),
          const SizedBox(height: 10),
          if (controller.errorMessage != null)
            Container(
                color: Colors.amberAccent,
                child: ListTile(
                    title: Text(controller.errorMessage!),
                    leading: const Icon(Icons.error),
                    trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => controller.setMessage(null),
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
          prefixIcon: const Icon(Icons.mail_outline_rounded),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 22),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: Colors.black45),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Colors.black45),
              gapPadding: 10),
        ));
  }

  TextFormField pwrdfield() {
    return TextFormField(
        controller: _passwordController,
        obscureText: true,
        validator: (value) =>
            value!.length < 6 ? "Password is too short" : null,
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter Your Password",
          prefixIcon: const Icon(Icons.vpn_key),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 22),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: Colors.black45),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Colors.black45),
              gapPadding: 10),
        ));
  }
}
