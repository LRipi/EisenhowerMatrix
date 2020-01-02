// import 'package:eisenhower_matrix/custom_drawer.dart';
import 'package:eisenhower_matrix/api_calls.dart';
import 'package:eisenhower_matrix/custom_drawer.dart';
import 'package:eisenhower_matrix/task.dart';
import 'package:flutter/material.dart';


class EditTaskPageArgument {
  final Task task;
  final bool isNew;


  EditTaskPageArgument(this.task, this.isNew);
}

class ExtractEditTaskPageArgument extends StatelessWidget {
  static const routeName = '/editTaskView';

  @override
  Widget build(BuildContext context) {
    final EditTaskPageArgument args = ModalRoute.of(context).settings.arguments;

    return EditTaskPage (task: args.task, isNew: args.isNew);
  }
}

class EditTaskPage extends StatefulWidget {
  final Task task;
  final bool isNew;

  int emergency;
  int importance;

  String title;
  String description;

  EditTaskPage ({@required this.task, this.isNew}) {
    emergency = task.urgency;
    importance = task.importance;
    title = task.title;
    description = task.description;
  }

  @override
  EditTaskPageState createState () => EditTaskPageState();
}

class EditTaskPageState extends State<EditTaskPage> {

  EditTaskPageState();

  final _descriptionController = TextEditingController();
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.text = widget.title;
    _descriptionController.text = widget.description;
    print('emergency and importance in build: ' + widget.emergency.toString() + ', ' + widget.importance.toString() );
    return Scaffold(
      drawer: CustomDrawer (
        onSignOut: null,
      ),
      appBar: AppBar(
        title: Text( widget.isNew ? 'Create Task' : 'Edit Task' ),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: Center(
        child: Form(
          child: Container(
            margin: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Description'),
                      controller: _descriptionController,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                    ),
                    Text('Urgency'),
                    Slider.adaptive(
                      onChanged: (_value){
                        setState((){
                          widget.title = _titleController.text;
                          widget.description = _descriptionController.text;
                          widget.emergency = _value.toInt();
                        });
                      },
                      value: widget.emergency.toDouble(),
                      divisions: 9,
                      max: 10,
                      min: 1,
                      label: widget.emergency.toString(),
                    ),
                    Text('Importance'),
                    Slider.adaptive(
                      onChanged: (_value){
                        setState((){
                          widget.title = _titleController.text;
                          widget.description = _descriptionController.text;
                          widget.importance = _value.toInt();
                        });
                      },
                      value: widget.importance.toDouble(),
                      divisions: 9,
                      max: 10,
                      min: 1,
                      label: widget.importance.toInt().toString(),
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (_titleController.text != '' && _titleController.text != null &&
                        _descriptionController.text != null && _descriptionController.text != '') {
                          widget.task.title = _titleController.text;
                          widget.task.description = _descriptionController.text;
                          widget.task.importance = widget.importance;
                          widget.task.urgency = widget.emergency;
                          if (widget.isNew)
                            ApiCalls.createTask(widget.task);
                          else
                            ApiCalls.updateTask(widget.task);
                          Navigator.of(context).pop();
                        }

                      },
                      child: Text(widget.isNew ? 'Add task' : 'Save task'),
                      color: Colors.blue,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (!widget.isNew)
                          ApiCalls.deleteTask(widget.task);
                        Navigator.of(context).pop();
                      },
                      child: Text(widget.isNew ? 'Cancel' : 'Remove task'),
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}