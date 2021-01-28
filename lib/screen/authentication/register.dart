import 'package:flutter/material.dart';
import 'package:moch/services/authService.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();  // use for validator
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height:20.0),
              TextFormField(
                decoration: InputDecoration(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                onChanged: (val){
                  setState(() => email = val);
                },
              ),
              SizedBox(height:20.0),
              TextFormField(
                decoration: InputDecoration(hintText: 'Password'),
                validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                obscureText: true,
                onChanged: (val){
                  setState(() => password = val);
                }
              ),
              SizedBox(height:20.0),
              RaisedButton(
                color: Colors.blue[400],
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    print('validated');
                    print(email + ' and ' + password);
                  }
                },
              ),
              RaisedButton(
                color: Colors.blue[400],
                child: Text(
                  'Sign In',
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