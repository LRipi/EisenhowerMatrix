import 'package:flutter/material.dart';

class MatrixPage extends StatefulWidget {
  MatrixPage({Key key}) : super(key: key);

  @override
  _MatrixPageState createState() => _MatrixPageState();
}

class _MatrixPageState extends State<MatrixPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  impontanceText: "Pas Important",
                  color: Colors.orange,
                  onPressed: () => {},
                ),
                new VerticalDivider(width: 1.0),
                new Button(
                  urgencyText: "Urgent",
                  impontanceText: "Important",
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
                  impontanceText: "Pas Important",
                  color: Colors.blue,
                  onPressed: () => {},
                ),
                new VerticalDivider(width: 1.0),
                new Button(
                  urgencyText: "Pas urgent",
                  impontanceText: "Important",
                  color: Colors.yellow,
                  onPressed: () => {},
                )
              ],
            ),
          ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

class Button extends StatelessWidget {
  Button({this.urgencyText, this.impontanceText, this.color, this.onPressed});
  final String urgencyText;
  final String impontanceText;
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
              Text(impontanceText),
            ],
          ),
        ),
      ),
    );
  }
}