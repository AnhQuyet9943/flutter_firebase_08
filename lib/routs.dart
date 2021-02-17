
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_08/sign_in/sign_in_screen.dart';
import 'package:flutter_firebase_08/sign_up/sign_up_screen.dart';
final Map<String, WidgetBuilder> routes = {

  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),

};