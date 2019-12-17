// import 'package:eisenhower_matrix/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../task.dart';

class EditTaskPageArgument {
  final Task task;

  EditTaskPageArgument(this.task);
}

class ExtractEditTaskPageArgument extends StatelessWidget {
  static const routeName = '/editTaskView';

  @override
  Widget build(BuildContext context) {
    final EditTaskPageArgument args = ModalRoute.of(context).settings.arguments;

    return EditTaskPage ();
  }
}

class EditTaskPage extends StatefulWidget {
  EditTaskPage();

  @override
  EditTaskPageState createState () => EditTaskPageState();
}

class EditTaskPageState extends State<EditTaskPage> {

  bool updating = false;

  EditTaskPageState();
  // {
  // }

  void _getData() async {
    setState(() {
      updating = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (updating == false) {
      _getData();
    }
    updating = false;

    return Scaffold(
      // drawer: CustomDrawer (
      //   onSignOut: () => widget.onSignOut(),
      // ),
      appBar: AppBar(
        title: Text('Add task'),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Save Task',
        backgroundColor: Colors.purple,
        child: Icon(Icons.save),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}