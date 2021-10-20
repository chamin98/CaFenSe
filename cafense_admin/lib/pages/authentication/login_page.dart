import 'package:cafense_admin/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                constraints: BoxConstraints(maxWidth: 400),
                padding: EdgeInsets.all(24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Image.asset("assets/logo.png"),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(children: [
                        Text("Login",
                            style: GoogleFonts.roboto(
                                fontSize: 30, fontWeight: FontWeight.bold))
                      ]),
                      SizedBox(height: 10),
                      Row(children: [
                        Text(
                          "Welcome back to the admin panel.",
                          style: TextStyle(color: Colors.grey),
                        )
                      ]),
                      SizedBox(height: 15),
                      TextField(
                          decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "abc@domain.com",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      SizedBox(height: 15),
                      TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "123",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      SizedBox(height: 15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              Text("Remember me")
                            ]),
                            Text("Forget Password")
                          ]),
                      SizedBox(height: 15),
                      InkWell(
                          onTap: () {
                            Get.offAllNamed(rootRoute);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffa4a6b3),
                                  borderRadius: BorderRadius.circular(20)),
                              alignment: Alignment.center,
                              width: double.maxFinite,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text("Login",
                                  style: TextStyle(color: Colors.white)))),
                      SizedBox(height: 15),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(text: "Do not have admin credentials? "),
                        TextSpan(
                            text: "Request Credentials! ",
                            style: TextStyle(color: Color(0xffa4a6b3)))
                      ]))
                    ]))));
  }
}
    
    
    
    
    
    /* Container(
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                  child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffa4a6b3)),
              ))
            ],
          )
        ],
      ),
    );
  }
}
 */