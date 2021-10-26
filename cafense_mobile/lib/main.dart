import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cafense_mobile/services/authservices.dart';
import 'package:cafense_mobile/routes.dart';
import 'src/home.dart';
import 'src/supNlgn/Login.dart';
import 'src/supNlgn/Register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Authservices>.value(value: Authservices()),
          StreamProvider<User?>.value(
              value: Authservices().user, initialData: null)
        ],
        child: MaterialApp(
          title: "Caffense",
          theme: ThemeData(primarySwatch: Colors.amber),
          home: Wrapper(),
          routes: routes,
        ));
  }
}

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isToggle = false;

  void toggleScreen() {
    setState(() {
      isToggle = !isToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isToggle) {
      return Register(toggleScreen: toggleScreen);
    } else {
      return Login(toggleScreen: toggleScreen);
    }
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user != null) {
      return bottomNavbar();
    } else
      return Authentication();
  }
}
