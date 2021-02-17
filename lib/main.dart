import 'package:flutter/material.dart';
import 'package:flutter_firebase_08/routs.dart';
import 'package:flutter_firebase_08/sign_in/sign_in_screen.dart';
import 'package:flutter_firebase_08/sign_up/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
      initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}

