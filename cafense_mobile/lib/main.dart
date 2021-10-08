import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:cafense_mobile/src/supNlgn/authentication.dart';
import 'package:cafense_mobile/routes.dart';

import 'src/home.dart';
import 'src/supNlgn/Login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}ato

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<Authentication>(
          create: (_) => Authentication(FirebaseAuth.instance)),
      StreamProvider(
        create: (context) => context.read<Authentication>().authStatChanges,
        initialData: null,
      )
    ], child: MaterialApp(title: "Caffense", home: AuthenticationWrapper()));
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseUser = context.watch<User?>();

    if (FirebaseUser != null) {
      return home();
    } else
      return Login();
  }
}
