import 'package:eisenhower_matrix/custom_drawer.dart';
import 'package:flutter/material.dart';

class MatrixPage extends StatelessWidget {

  final VoidCallback onSignOut;

  MatrixPage({@required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer (
        onSignOut: () => onSignOut(),
      ),
      appBar: AppBar(
        title: Text('Eisenhower Matrix'),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Expanded(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Button(
                    urgencyText: "Urgent",
                    importanceText: "Pas Important",
                    color: Colors.pink,
                    onPressed: () => {},
                  ),
                  new VerticalDivider(width: 1.0),
                  new Button(
                    urgencyText: "Urgent",
                    importanceText: "Important",
                    color: Colors.green,
                    onPressed: () => {},
                  )
                ],
              ),
            ),
            new Divider(height: 1.0),
            new Expanded(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Button(
                    urgencyText: "Pas urgent",
                    importanceText: "Pas Important",
                    color: Colors.blue,
                    onPressed: () => {},
                  ),
                  new VerticalDivider(width: 1.0),
                  new Button(
                    urgencyText: "Pas urgent",
                    importanceText: "Important",
                    color: Colors.yellow,
                    onPressed: () => {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Add item',
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

class Button extends StatelessWidget {
  Button({this.urgencyText, this.importanceText, this.color, this.onPressed});
  final String urgencyText;
  final String importanceText;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: MaterialButton(
          onPressed: onPressed,
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(urgencyText),
              Text(importanceText),
            ],
          ),
        ),
      ),
    );
  }
}