
import 'package:eisenhower_matrix/authentication.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onSignOut;

  CustomDrawer({@required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Drawer (
      child: Container(
        color: Colors.black,
        child: SafeArea (
          child: ListView (
            children: <Widget> [
              RaisedButton (
                color: Colors.white,
                child: Text (
                  'Se déconnecter',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  )
                ),
                onPressed: _() => _() {
                  Authentication.disconnect();
                  Navigator.pop(context);
                  if (onSignOut != null)
                    onSignOut();
                  Navigator.of(context).popUntil((route) => route.settings.name == "/");
                },
              )
            ]
          )
        ),
      )
    );
  }
}