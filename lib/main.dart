import 'package:flutter/material.dart';
import 'package:moch/screen/home/dashboard.dart';
import 'package:moch/screen/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:moch/services/authService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Roboto'),
        home: Wrapper(),
      ),
    );
  }
}
