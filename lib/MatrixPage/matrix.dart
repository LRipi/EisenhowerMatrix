import 'package:eisenhower_matrix/api_calls.dart';
import 'package:eisenhower_matrix/custom_drawer.dart';
import 'package:eisenhower_matrix/task_list_page.dart';
import 'package:flutter/material.dart';

class MatrixPage extends StatefulWidget {
  final VoidCallback onSignOut;

  MatrixPage({@required this.onSignOut});

  @override
  MatrixPageState createState () => MatrixPageState();
}

class MatrixPageState extends State<MatrixPage> {

  bool updating = false;

  TaskListInfo urgentPasImportant;
  TaskListInfo urgentImportant;
  TaskListInfo pasUrgentPasImportant;
  TaskListInfo pasUrgentImportant;

  MatrixPageState()
  {
    urgentPasImportant = new TaskListInfo(
        "Urgent, Pas Important", true, false, 0
    );
    pasUrgentPasImportant = new TaskListInfo(
        "Pas Urgent, PasImportant", false, false, 0
    );
    pasUrgentImportant = new TaskListInfo(
        "Pas Urgent, Important", false, true, 0
    );
    urgentImportant = new TaskListInfo(
        "Urgent, Important", true, true, 0
    );
  }

  void _getData() async {
    setState(() {
      updating = true;
      ApiCalls.updateAmountFromTaskLists(urgentPasImportant);
      ApiCalls.updateAmountFromTaskLists(pasUrgentPasImportant);
      ApiCalls.updateAmountFromTaskLists(urgentImportant);
      ApiCalls.updateAmountFromTaskLists(pasUrgentImportant);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (updating == false) {
      _getData();
    }
    updating = false;

    return Scaffold(
      drawer: CustomDrawer (
        onSignOut: () => widget.onSignOut(),
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
                  taskList: urgentPasImportant,
                    color: Colors.pink,
                ),
                new VerticalDivider(width: 1.0),
                new Button(
                  taskList: urgentImportant,
                    color: Colors.green,
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
                  taskList: pasUrgentPasImportant,
                    color: Colors.blue,
                  ),
                  new VerticalDivider(width: 1.0),
                  new Button(
                  taskList: pasUrgentImportant,
                    color: Colors.yellow,
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
  Button({this.taskList, this.color});
  TaskListInfo taskList;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExtractTaskListPageArgument (),
                settings: RouteSettings(
                  arguments: TaskListPageArgument (
                    taskList
                  ),
                )
              )
            );
          },
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(taskList.urgent == true ? 'Urgent' : 'Pas urgent'),
              Text(taskList.important == true ? 'Important' : 'Pas important'),
            ],
          ),
        ),
      ),
    );
  }
}