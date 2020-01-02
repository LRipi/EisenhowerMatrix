import 'package:eisenhower_matrix/custom_drawer.dart';
import 'package:eisenhower_matrix/task.dart';
import 'package:flutter/material.dart';

import 'EditTask/edit_task.dart';
import 'api_calls.dart';

class TaskListInfo {
  String name;
  bool urgent;
  bool important;

  int amount;

  Color startColor;
  Color endColor;

  TaskListInfo(this.name, this.urgent, this.important, this.amount,
      this.startColor, this.endColor);

}

class TaskListPageArgument {
  final TaskListInfo info;

  TaskListPageArgument(this.info);
}

class ExtractTaskListPageArgument extends StatelessWidget {
  static const routeName = '/taskListView';

  @override
  Widget build(BuildContext context) {
    final TaskListPageArgument args = ModalRoute.of(context).settings.arguments;

    return TaskListPage (listInfo: args.info);
  }
}

class TaskListPageState extends State<TaskListPage> {
  bool updating = false;
  List<Task> taskList = new List<Task> ();

  void _getData() async {
    List<Task> list = await ApiCalls.getTasksFromList(widget.listInfo);

    setState(() {
      updating = true;
      taskList = list;
    });
  }

  @override
  Widget build (BuildContext ctx) {
    if (updating == false) {
      _getData();
    }
    updating = false;
    return Scaffold (
      drawer: CustomDrawer(
        onSignOut: null,
      ),
      appBar: AppBar (
        title: Text(
          widget.listInfo.name,
        )
      ),
      body: SafeArea(
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder (
      itemCount: taskList.length,
      itemBuilder: (context, i) {
        return _buildTile(context, taskList[i]);
      }
    );
  }

  Widget _buildTile(BuildContext context, Task task) {
    return Container (
      decoration: BoxDecoration (
        borderRadius: BorderRadius.circular(18.0),
        gradient: LinearGradient (
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 1],
          colors: [
            widget.listInfo.startColor,
            widget.listInfo.endColor,
          ]
        )
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              // print("flkanjklfbjhgagbf,k");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExtractEditTaskPageArgument (),
                  settings: RouteSettings(
                    arguments: EditTaskPageArgument (
                      task,
                      false,
                    ),
                  )
                )
              );
            },
            child: Text(
                'toto',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                )
            ),
          ),

        ],
      ),
    );
  }
}

class TaskListPage extends StatefulWidget {
  final TaskListInfo listInfo;

  TaskListPage ({@required this.listInfo});

  @override
  TaskListPageState createState () => TaskListPageState();
}