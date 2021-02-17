
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_08/sign_up/components/body.dart';
class SignUpScreen extends StatelessWidget {
  static final routeName = '/sign_up';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Sign - up')
      ),
      body: Body(),
    );
  }
}