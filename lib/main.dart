import 'package:eisenhower_matrix/task_list_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        ExtractTaskListPageArgument.routeName: (context) => ExtractTaskListPageArgument(),
      },
      title: 'Eisenhower Matrix',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}