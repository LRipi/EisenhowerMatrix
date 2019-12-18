import 'package:eisenhower_matrix/authentication.dart';
import 'package:flutter/material.dart';
import 'register.dart';

class LoginPage extends StatelessWidget
{
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final VoidCallback onSignIn;

  LoginPage({@required this.onSignIn});

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
                controller: _usernameController,
                decoration: InputDecoration(
                    labelText: "Enter your username",
                    icon: Icon(Icons.person),
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Enter your password",
                  icon: Icon(Icons.vpn_key),
                ),
              )
            ),
            FlatButton(
              onPressed: () {
                /*Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MatrixPage()),
                );
                */
                print("should put new status to connected");
                Authentication.setAuthState(AuthState.connected);
                onSignIn();
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
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