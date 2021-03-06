import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class BuildContentSignUp extends StatefulWidget {
  @override
  _BuildContentState createState() => _BuildContentState();
}

class _BuildContentState extends State<BuildContentSignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail = '';

  FToast fToast;

  @override
  initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  Widget toast1(String email) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.greenAccent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check),
        SizedBox(
          width: 12.0,
        ),
        Text('$email} Register Done'),
      ],
    ),
  );

  Widget toast2() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.red,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.highlight_remove),
        SizedBox(
          width: 12.0,
        ),
        Text('Failed to register in with Email & Password'),
      ],
    ),
  );

  _showToast1(String email) {
    fToast.showToast(
      child: toast1(email),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  _showToast2() {
    fToast.showToast(
      child: toast2(),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "REGISTER",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 20),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.lightBlue[800],
                          ),
                          labelText: "E-mail"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.lightBlue[800],
                          ),
                          labelText: "Password"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height:
                              1.4 * (MediaQuery.of(context).size.height / 20),
                          width: 5 * (MediaQuery.of(context).size.width / 10),
                          margin: EdgeInsets.only(bottom: 20),
                          child: RaisedButton(
                            elevation: 5.0,
                            color: Colors.lightBlue[800],
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                await _register();
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "REGISTER",
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.5,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 40),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
   try {
     final User user = (await _auth.createUserWithEmailAndPassword(
       email: _emailController.text,
       password: _passwordController.text,
     ))
         .user;
     _showToast1(user.email);
   } catch (e) {

     _showToast2();
     // Scaffold.of(context).showSnackBar(
     //   const SnackBar(
     //     content: Text('Failed to register in with Email & Password'),
     //   ),
     // );
   }
  }
}
