import 'dart:convert';

import 'package:eisenhower_matrix/api_calls.dart';
import 'package:eisenhower_matrix/authentication.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'register.dart';

class LoginPage extends StatefulWidget {
  
  final VoidCallback onSignIn;

  LoginPage({@required this.onSignIn});
  
  @override
  _LoginPageState createState() => _LoginPageState(onSignIn: onSignIn);
}

class _LoginPageState extends State<LoginPage>
{
  final VoidCallback onSignIn;

  _LoginPageState({@required this.onSignIn});

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void errorPopUp(String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error', style: TextStyle(color: Colors.red)),
          content: Text(error, style: TextStyle(color: Colors.red)), 
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close", style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ]
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center (
        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      labelText: "Enter your email",
                      icon: Icon(Icons.mail),
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
                        var response = await http.post(ApiCalls.baseUrl + 'users/login', body: {'login': _usernameController.text, 'password': _passwordController.text});
                        if (jsonDecode(response.body)['success'] == true) {
                          Authentication.setAuthState(AuthState.connected);
                          Authentication.setJwtToken(jsonDecode(response.body)['user']['token']);
                          onSignIn();
                        } else {
                          switch (response.statusCode)
                          {
                            case 422:
                              errorPopUp("Missing password or username.");
                              break;
                            case 401:
                              errorPopUp(jsonDecode(response.body)['message']);
                              break;
                            default:
                              errorPopUp("Unknown error during authentification.");
                              break;
                          }
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
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
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
          )
        )
      )
    );
  }
}