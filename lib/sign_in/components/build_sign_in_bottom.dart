import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_08/sign_up/sign_up_screen.dart';

class BuildSignInBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, SignUpScreen.routeName);
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Dont have an account? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  TextSpan(
                    text: 'Sigin Up ',
                    style: TextStyle(
                      color: Colors.lightBlue[800],
                      fontSize: MediaQuery.of(context).size.height / 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
                  //   child: Text('Sign Up',style: TextStyle(fontSize: getProportionateScreenWidth(16),
                  //       color: kPrimaryColor),),
                  // )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
