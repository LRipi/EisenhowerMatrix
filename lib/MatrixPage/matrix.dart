import 'package:eisenhower_matrix/EditTask/edit_task.dart';
import 'package:eisenhower_matrix/api_calls.dart';
import 'package:eisenhower_matrix/custom_drawer.dart';
import 'package:eisenhower_matrix/task.dart';
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
        "Urgent, Pas Important", true, false, 0,
        Color.fromRGBO(204, 43, 94, 1), Color.fromRGBO(117, 58, 136, 1)
    );
    pasUrgentPasImportant = new TaskListInfo(
        "Pas Urgent, PasImportant", false, false, 0,
        Color.fromRGBO(33, 147, 176, 1), Color.fromRGBO(109, 213, 237, 1)
    );
    pasUrgentImportant = new TaskListInfo(
        "Pas Urgent, Important", false, true, 0,
        Color.fromRGBO(214, 109, 117, 1), Color.fromRGBO(226, 149, 135, 1)
    );
    urgentImportant = new TaskListInfo(
       "Urgent, Important", true, true, 0,
        Color.fromRGBO(86, 171, 47, 1), Color.fromRGBO(168, 224, 99, 1)
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
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(
                    taskList: urgentPasImportant,
                  ),
                  VerticalDivider(width: 1.0),
                  Button(
                    taskList: urgentImportant,
                  )
                ],
              ),
            ),
            Divider(height: 1.0),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Button(
                    taskList: pasUrgentPasImportant,
                  ),
                  VerticalDivider(width: 1.0),
                  Button(
                    taskList: pasUrgentImportant,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExtractEditTaskPageArgument (),
              settings: RouteSettings(
                arguments: EditTaskPageArgument (
                  new Task(),
                  true,
                ),
              )
            )
          );
        },
        tooltip: 'Add item',
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    ) ;
  }
}

class Button extends StatelessWidget {
  Button({this.taskList});
  final TaskListInfo taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: FlatButton(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(taskList.urgent == true ? 'Urgent' : 'Pas urgent'),
              Text(taskList.important == true ? 'Important' : 'Pas important'),
              Divider (),
              Text(
                taskList.amount.toString(),
                style: TextStyle(
                  fontSize: 25,
                ),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 1],
            colors: [
              taskList.startColor,
              taskList.endColor,
            ],
          ),
        )
      ),
    );
  }
}