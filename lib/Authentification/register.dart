import 'package:flutter/material.dart';
import 'login.dart';

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
                controller: _mailcontroller,
                decoration: new InputDecoration(
                    labelText: "Enter your email",
                    icon: Icon(Icons.mail),
                  ),
                )
            ),
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
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              buttonMinWidth: 150,
              children: <Widget>[
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('Register'),
                  onPressed: () async {
                    if (_passwordcontroller.text == _passwordconfirmcontroller.text) {
                      var response = await http.post('http://192.168.1.16:3000/users/create', body: {'name': _usernamecontroller.text, 'login': _mailcontroller.text, 'password': _passwordcontroller.text});
                      debugPrint('Status Code: ' + response.statusCode.toString() + '\nBody: ' + response.body.toString());
                      if (response.statusCode == 201)
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage(onSignIn: () {},)),
                        );
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
    );
  }
}