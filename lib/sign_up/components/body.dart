import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_08/sign_up/components/build_content_sign_up.dart';
import 'package:flutter_firebase_08/sign_up/components/build_logo_sign_up.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue[800],
                    borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(70),
                        bottomRight: const Radius.circular(70))),
              ),
            ),
            ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildLogoSignUp(),
                BuildContentSignUp(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
