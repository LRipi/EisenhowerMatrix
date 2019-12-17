import 'package:flutter/material.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
              child: TextField(
                obscureText: true,
                controller: _passwordcontroller,
                decoration: new InputDecoration(
                  labelText: "Confirm your password",
                  icon: Icon(Icons.vpn_key),
                ),
              )
            ),
            FlatButton(
              onPressed: () {
                debugPrint('Username: ' + _usernamecontroller.text + '\nPassword: ' + _passwordcontroller.text);
              },
              child: Text('Register'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'You already have an account ?',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    )
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Login',
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