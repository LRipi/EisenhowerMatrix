import 'package:flutter/material.dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
{
  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              TextField(
                controller: _usernamecontroller,
                decoration: new InputDecoration(
                  labelText: "Enter your username",
                  
                ),
              ),
              TextField(
                controller: _passwordcontroller,
                decoration: new InputDecoration(labelText: "Enter your password"),
              ),
              FlatButton(
                onPressed: () {
                  debugPrint('Username: ' + _usernamecontroller.text + '\nPassword: ' + _passwordcontroller.text);
                },
                child: Text('Login'),
              )
            ], 
          ),
        )
    );
  }
}