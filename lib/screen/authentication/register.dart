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
  String error = '';
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
                validator: (val) => val.isEmpty ? 'Enter an password' : null,
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
              SizedBox(height: 15.0,),
              RaisedButton(
                color: Colors.blue[400],
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    dynamic result = await _authService.registerWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(()=> error = 'please input valid email');
                    }
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