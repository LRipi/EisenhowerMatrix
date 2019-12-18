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
  final _passwordconfirmcontroller = TextEditingController();
  bool error = false;

  void setError(bool val) {
    setState(() {
      error = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
              child: TextField(
                controller: _usernamecontroller,
                decoration: InputDecoration(
                    labelText: "Enter your username",
                    icon: Icon(Icons.person),
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
              child: TextField(
                obscureText: true,
                controller: _passwordcontroller,
                decoration: InputDecoration(
                  labelText: "Enter your password",
                  icon: Icon(Icons.vpn_key),
                ),
              )
            ),
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
            FlatButton(
              onPressed: () {
              },
              child: Text('Register'),
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
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage(onSignIn: () {},)),
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
        )
      )
    );
  }
}