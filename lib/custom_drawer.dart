
import 'package:eisenhower_matrix/api_calls.dart';
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
              _eraseAllTasksButton(context),
              _deleteAccountButton(context),
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

  Widget _eraseAllTasksButton(BuildContext context)
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
                        'Erase All Tasks',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        )
                    ),
                  ),
                  onPressed: () {
                    ApiCalls.eraseAllTasks();
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

  Widget _deleteAccountButton(BuildContext context)
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
                        'Delete Account',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        )
                    ),
                  ),
                  onPressed: () {
                    Authentication.eraseAccount();
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