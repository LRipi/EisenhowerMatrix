// import 'package:eisenhower_matrix/custom_drawer.dart';
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

  EditTaskPage ({@required this.task, this.isNew});

  @override
  EditTaskPageState createState () => EditTaskPageState();
}

class EditTaskPageState extends State<EditTaskPage> {

  EditTaskPageState();

  @override
  Widget build(BuildContext context) {
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
                    TextFormField(
                  initialValue: widget.task.title,
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextFormField(
                  initialValue: widget.task.description,
                      maxLines: 4,
                      decoration: InputDecoration(labelText: 'Description'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                    ),
                    Text('Urgency'),
                    Slider.adaptive(
                      onChanged: (_value){
                        setState((){
                      widget.task.urgency = _value.toInt();
                        });
                      },
                  value: widget.task.urgency.toDouble(),
                      divisions: 9,
                      max: 10,
                      min: 1,
                  label: widget.task.urgency.toInt().toString(),
                    ),
                    Text('Importance'),
                    Slider.adaptive(
                      onChanged: (_value){
                        setState((){
                      widget.task.importance = _value.toInt();
                        });
                      },
                  value: widget.task.importance.toDouble(),
                      divisions: 9,
                      max: 10,
                      min: 1,
                  label: widget.task.importance.toInt().toString(),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text(widget.isNew ? 'Add task' : 'Save task'),
                      color: Colors.blue,
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