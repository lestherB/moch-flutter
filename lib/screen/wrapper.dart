import 'package:flutter/material.dart';
import 'package:moch/models/user.dart';
import 'package:moch/screen/authentication/auth.dart';
import 'package:moch/screen/home/dashboard.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context); 

    // return logged in or logged out views
    if(user == null){
      print("no credentials");
      return Auth();
    }else{
      print("logged in is called");
      return Dashboard();
    }
  }
}
