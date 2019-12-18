
import 'package:eisenhower_matrix/authentication.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onSignOut;

  CustomDrawer({@required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Drawer (
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        padding: const EdgeInsets.all(16.0),
        child: Container (
          child: Column (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              _disconnectButton(context),
            ]
          )
        )
      )
    );
  }

  Widget _disconnectButton(BuildContext context)
  {
    return Container (
      child: Row(
        children: <Widget> [
          Expanded (
            child: RaisedButton (
              color: Colors.orange,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Text (
                  'Se déconnecter',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  )
                ),
              ),
              onPressed: () {
                Authentication.disconnect();
                Navigator.pop(context);
                if (onSignOut != null)
                  onSignOut();
                Navigator.of(context).popUntil((route) => route.settings.name == "/");
              },
            ),
          ),
        ]
      )
    );
  }
}