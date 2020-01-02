import 'dart:convert';

import 'package:eisenhower_matrix/authentication.dart';
import 'package:http/http.dart' as http;
import 'package:eisenhower_matrix/task.dart';
import 'package:eisenhower_matrix/task_list_page.dart';

class ApiCalls {
  static String baseUrl = 'http://vps.lemartret.com:3000/';

  static Future<void> updateAmountFromTaskLists(TaskListInfo info) async {
    info.amount = 5;
    // return info;
  }

  static Future<List<Task>> getTasksFromList (TaskListInfo listInfo) async {
    List<Task> result = new List<Task> ();
    http.Response response = await http.get(baseUrl + '/tasks', headers: {
      "x-access-token": Authentication.jwtToken
    });
    if (jsonDecode(response.body)['success'] == true) {
      for (var i = 0; i < jsonDecode(response.body)['tasks'].length; i++) {
        Task tmp = new Task();
        tmp.title = jsonDecode(response.body)['tasks'][i]['title'];
        tmp.description = jsonDecode(response.body)['tasks'][i]['description'];
        tmp.id = jsonDecode(response.body)['tasks'][i]['id'];
        result.add(tmp);
      }
    }
    return result;
  }

  static Future<List<Task>> getRemovedTasksFromList (TaskListInfo listInfo) async {
    List<Task> result = new List<Task> ();
    http.Response response = await http.get(baseUrl + '/tasks/history', headers: {
      "x-access-token": Authentication.jwtToken
    });
    if (jsonDecode(response.body)['success'] == true) {
      for (var i = 0; i < jsonDecode(response.body)['tasks'].length; i++) {
        Task tmp = new Task();
        tmp.title = jsonDecode(response.body)['tasks'][i]['title'];
        tmp.description = jsonDecode(response.body)['tasks'][i]['description'];
        tmp.id = jsonDecode(response.body)['tasks'][i]['id'];
        result.add(tmp);
      }
    }
    return result;
  }

  static void createTask(Task newTask) async {
    http.Response response = await http.post(baseUrl + '/tasks', headers: {
      "x-access-token": Authentication.jwtToken
    }, body: {
      "urgence": newTask.urgency,
      "importance": newTask.importance,
      "title": newTask.title,
      "description": newTask.description,
      "deadline": newTask.deadline
    });
  }

  static void updateTask(Task task) async {
    http.Response response = await http.put(baseUrl + '/tasks/' + task.id.toString(), headers: {
      "x-access-token": Authentication.jwtToken
    }, body: {
      "urgence": task.urgency,
      "importance": task.importance,
      "title": task.title,
      "description": task.description,
      "deadline": task.deadline
    });
  }

  static void deleteTask(Task task) async {
    http.Response response = await http.delete(baseUrl + '/tasks/' + task.id.toString(), headers: {
      "x-access-token": Authentication.jwtToken
    });
  }
}