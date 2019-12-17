import 'package:eisenhower_matrix/custom_drawer.dart';
import 'package:eisenhower_matrix/task.dart';
import 'package:flutter/material.dart';

import 'api_calls.dart';

class TaskListInfo {
  String name;
  bool urgent;
  bool important;

  int amount;

  TaskListInfo(this.name, this.urgent, this.important, this.amount);

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

    return TaskListPage (args.info);
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
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: EdgeInsets.all(16.0),
      color: Colors.orange,
      child: Column(
        children: <Widget>[
          Text(
            'toto',
            style: TextStyle(
              fontSize: 22,
            )
          ),
        ],
      ),
    );
  }
}

class TaskListPage extends StatefulWidget {
  TaskListInfo listInfo;

  TaskListPage (TaskListInfo list) {
    this.listInfo = list;
  }

  @override
  TaskListPageState createState () => TaskListPageState();
}