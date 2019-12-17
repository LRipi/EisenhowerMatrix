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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
              child: TextField(
                controller: _usernamecontroller,
                decoration: new InputDecoration(
                    labelText: "Enter your username",
                    icon: Icon(Icons.person),
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
              child: TextField(
                obscureText: true,
                controller: _passwordcontroller,
                decoration: new InputDecoration(
                  labelText: "Enter your password",
                  icon: Icon(Icons.vpn_key),
                ),
              )
            ),
            FlatButton(
              onPressed: () {
                debugPrint('Username: ' + _usernamecontroller.text + '\nPassword: ' + _passwordcontroller.text);
              },
              child: Text('Login'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Not registered yet ?',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    )
                  ),
                  FlatButton(
                    onPressed: () {
                      debugPrint('I will register');
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  )
                ],
              )
            ),
          ], 
        ),
      )
    );
  }
}