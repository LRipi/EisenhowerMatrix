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
                    colorStart: Color.fromRGBO(204, 43, 94, 1),
                    colorEnd: Color.fromRGBO(117, 58, 136, 1),
                    onPressed: () => {},
                  ),
                  new VerticalDivider(width: 1.0),
                  new Button(
                    urgencyText: "Urgent",
                    importanceText: "Important",
                    colorStart: Color.fromRGBO(86, 171, 47, 1),
                    colorEnd: Color.fromRGBO(168, 224, 99, 1),
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
                    colorStart: Color.fromRGBO(33, 147, 176, 1),
                    colorEnd: Color.fromRGBO(109, 213, 237, 1),
                    onPressed: () => {},
                  ),
                  new VerticalDivider(width: 1.0),
                  new Button(
                    urgencyText: "Pas urgent",
                    importanceText: "Important",
                    colorStart: Color.fromRGBO(255, 175, 189, 1),
                    colorEnd: Color.fromRGBO(255, 195, 160, 1),
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
  Button({this.urgencyText, this.importanceText, this.colorStart, this.colorEnd, this.onPressed});
  final String urgencyText;
  final String importanceText;
  final Color colorStart;
  final Color colorEnd;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: FlatButton(
          onPressed: onPressed,
          // color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(urgencyText),
              Text(importanceText),
            ],
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(18.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 1],
            colors: [
              colorStart,
              colorEnd,
            ],
          ),
        )
      ),
    );
  }
}