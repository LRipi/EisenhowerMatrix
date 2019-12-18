import 'dart:convert';

import 'package:eisenhower_matrix/MatrixPage/matrix.dart';
import 'package:eisenhower_matrix/authentication.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              buttonMinWidth: 150,
              children: <Widget>[
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('Login'),
                  onPressed: () async {
                    if (_usernameController.text != '' && _passwordController.text != '') {
                      var response = await http.post('http://192.168.1.16:3000/users/login', body: {'login': _usernameController.text, 'password': _passwordController.text});
                      if (jsonDecode(response.body)['success'] == true) {
                        print("should put new status to connected");
                        Authentication.setAuthState(AuthState.connected);
                        onSignIn();
                      } else {
                        debugPrint('error: ' + response.statusCode.toString());
                      }
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                  ),
                )
              ],
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
                  ButtonBar(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ),
          ],
        ),
      )
    );
  }
}