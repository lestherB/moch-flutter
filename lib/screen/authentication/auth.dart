import 'package:flutter/material.dart';
import 'package:moch/screen/authentication/signIn.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}
