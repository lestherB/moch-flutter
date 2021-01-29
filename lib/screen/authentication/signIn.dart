import 'package:flutter/material.dart';
import 'package:moch/services/authService.dart';
import 'package:moch/screen/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height:20.0),
              TextFormField(
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (val){
                  setState(() => email = val);
                },
              ),
              SizedBox(height:20.0),
              TextFormField(
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
                onChanged: (val){
                  setState(() => password = val);
                }
              ),
              SizedBox(height:20.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              RaisedButton(
                color: Colors.blue[400],
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async{
                  try {
                    setState(() => loading = true);
                    dynamic result = await _authService.signInWithEmailAndPassword(email, password);
                    if(result == null){
                      setState((){
                        error = 'something is wrong with your credentials.';
                        loading = false;
                      });
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
              RaisedButton(
                color: Colors.blue[400],
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: (){
                  widget.toggleView();
                },
              )
            ],
          ),
        )
      ),
    );
  }
}
