

import 'package:eisenhower_matrix/task.dart';
import 'package:eisenhower_matrix/task_list_page.dart';

class ApiCalls {

  static Future<void> updateAmountFromTaskLists(TaskListInfo info) async {
    info.amount = 5;
    //return info;
  }

  //TODO link to API
  static Future<List<Task>> getTasksFromList (TaskListInfo listInfo) async {
    List<Task> result = new List<Task> ();
    Task tmp = new Task();
    tmp.title = "toto";
    tmp.description = "description lol";
    result.add(tmp);
    result.add(tmp);
    result.add(tmp);
    result.add(tmp);
    result.add(tmp);
    result.add(tmp);
    result.add(tmp);
    result.add(tmp);
    result.add(tmp);
    result.add(tmp);
    result.add(tmp);
    result.add(tmp);
    result.add(tmp);
    result.add(tmp);
    result.add(tmp);
    result.add(tmp);
    return result;
  }
}