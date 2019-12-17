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
                new Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(16.0),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Urgent'),
                          Text('Pas Imporant'),
                        ],
                      ),
                    ),
                  ),
                ),
                new VerticalDivider(width: 1.0),
                new Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(16.0),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.orange,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Urgent'),
                          Text('Important'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Divider(height: 1.0),
          new Expanded(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(16.0),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Pas urgent'),
                          Text('Pas Important'),
                        ],
                      ),
                    ),
                  ),
                ),
                new VerticalDivider(width: 1.0),
                new Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(16.0),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.yellow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Pas urgent'),
                          Text('Important'),
                        ],
                      ),
                    ),
                  ),
                ),
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
