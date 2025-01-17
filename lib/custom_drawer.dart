
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

    Future<String> validationPopUp() {
    return showDialog<String> (
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Confirm your action:'), 
          actions: <Widget>[
            new FlatButton(
              child: new Text("Accept"),
              onPressed: () {
                Navigator.of(context).pop('success');
              },
            ),
            new FlatButton(
              child: new Text("Decline"),
              onPressed: () {
                Navigator.of(context).pop('failed');
              },
            )
          ]
        );
      }
    );
  }

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
                  onPressed: () async {
                    var value = await validationPopUp();
                    if (value == 'success') {
                      ApiCalls.eraseAllTasks();
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ]
        )
    );
  }

  Widget _deleteAccountButton(BuildContext context)
  {

  Future<String> validationPopUp() {
    return showDialog<String> (
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Confirm your action:'), 
          actions: <Widget>[
            new FlatButton(
              child: new Text("Accept"),
              onPressed: () {
                Navigator.of(context).pop('success');
              },
            ),
            new FlatButton(
              child: new Text("Decline"),
              onPressed: () {
                Navigator.of(context).pop('failed');
              },
            )
          ]
        );
      }
    );
  }

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
                  onPressed: () async {
                    var value = await validationPopUp();
                    if (value == 'success') {
                      ApiCalls.eraseAllTasks();
                      ApiCalls.eraseAccount();
                      Authentication.disconnect();
                      Navigator.pop(context);
                      if (onSignOut != null)
                        onSignOut();
                      Navigator.of(context).popUntil((route) => route.settings.name == "/");
                    }
                  },
                ),
              ),
            ]
        )
    );
  }
}