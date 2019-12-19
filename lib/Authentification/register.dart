import 'dart:convert';

import 'package:eisenhower_matrix/Authentification/login.dart';
import 'package:eisenhower_matrix/api_calls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
{
  final _usernamecontroller = TextEditingController();
  final _mailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _passwordconfirmcontroller = TextEditingController();
  bool error = false;

  void errorPopUp(String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error', style: TextStyle(color: Colors.red)),
          content: Text(error, style: TextStyle(color: Colors.red)), 
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ]
        );
      }
    );
  }

  void setError(bool val) {
    setState(() {
      error = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center (
        child: SingleChildScrollView(
          child: Column(

            children: <Widget>[
              RegisterTextField(label: 'Enter your email', controller: _mailcontroller, obscureText: false, icon: Icon(Icons.mail)),
              RegisterTextField(label: 'Enter your username', controller: _usernamecontroller, obscureText: false, icon: Icon(Icons.person)),
              RegisterTextField(label: 'Enter your password', controller: _passwordcontroller, obscureText: true, icon: Icon(Icons.vpn_key)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                child: TextField(
                  obscureText: true,
                  controller: _passwordconfirmcontroller,
                  decoration: InputDecoration(
                    labelText: "Confirm your password",
                    labelStyle: TextStyle(
                      color: error ? Colors.red : Colors.grey
                    ),
                    icon: Icon(Icons.vpn_key, color: error ? Colors.red : Colors.grey),
                  ),
                  onChanged: (confirmPassword) {
                    if (_passwordcontroller.text != _passwordconfirmcontroller.text)
                      setError(true);
                    else
                      setError(false);
                  },
                )
              ),
              ButtonBar(
                mainAxisSize: MainAxisSize.min,
                buttonMinWidth: 150,
                children: <Widget>[
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text('Register'),
                    onPressed: () async {
                      if (_passwordcontroller.text == _passwordconfirmcontroller.text) {
                        var response = await http.post(ApiCalls.baseUrl + 'users/create', body: {'name': _usernamecontroller.text, 'login': _mailcontroller.text, 'password': _passwordcontroller.text});
                        debugPrint('Status Code: ' + response.statusCode.toString() + '\nBody: ' + response.body.toString());
                        if (response.statusCode == 201)
                          Navigator.pop(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage(onSignIn: () {},)),
                          );
                        else
                           errorPopUp(jsonDecode(response.body)['message']);
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'You already have an account ?',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      )
                    ),
                    ButtonBar(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Login'),
                          onPressed: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage(onSignIn: () {},)),
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                          )
                        )
                      ],
                    )
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

class RegisterTextField extends StatelessWidget 
{
  RegisterTextField({this.label, this.controller, this.obscureText, this.icon});

  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final Icon icon;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
        child: TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            icon: icon,
          ),
        )
      );
  }
}