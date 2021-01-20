import 'package:flutter/material.dart';
import 'package:moch/services/authService.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text('Sign In Annon'),
          onPressed: () async {
            dynamic response = await _authService.signInAnon();
            print(response.uid);
          },
        ),
      ),
    );
  }
}
