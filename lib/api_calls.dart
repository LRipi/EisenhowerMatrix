import 'dart:convert';

import 'package:eisenhower_matrix/authentication.dart';
import 'package:http/http.dart' as http;
import 'package:eisenhower_matrix/task.dart';
import 'package:eisenhower_matrix/task_list_page.dart';

class ApiCalls {
  static String baseUrl = 'http://vps.lemartret.com:3000/';

  static Future<bool> updateAmountFromTaskLists(TaskListInfo info) async {
    String request = baseUrl + 'tasks/total?importance=' + info.important.toString() + '&urgence=' + info.urgent.toString();
    http.Response response = await http.get(request, headers: {
      "x-access-token": Authentication.jwtToken
    });
    if (response.statusCode == 200) {
      var jsonDecoded = jsonDecode(response.body);
      info.amount = jsonDecoded['number'];
      return true;
    }
    else {
      info.amount = -1;
      return false;
    }
  }

  static Future<List<Task>> getTasksFromList (TaskListInfo listInfo) async {
    List<Task> result = new List<Task> ();
    http.Response response = await http.get(baseUrl + 'tasks?importance=' + listInfo.important.toString() + '&urgence=' + listInfo.urgent.toString() , headers: {
      "x-access-token": Authentication.jwtToken
    });
    if (jsonDecode(response.body)['success'] == true) {
      for (var i = 0; i < jsonDecode(response.body)['tasks'].length; i++) {
        Task tmp = new Task();
        tmp.urgency = jsonDecode(response.body)['tasks'][i]['urgence'];
        tmp.importance = jsonDecode(response.body)['tasks'][i]['importance'];
        tmp.title = jsonDecode(response.body)['tasks'][i]['title'];
        tmp.description = jsonDecode(response.body)['tasks'][i]['description'];
        tmp.id = jsonDecode(response.body)['tasks'][i]['id'];
        tmp.status = jsonDecode(response.body)['tasks'][i]['status'];
        result.add(tmp);
      }
    }
    return result;
  }

  static Future<List<Task>> getRemovedTasksFromList (TaskListInfo listInfo) async {
    List<Task> result = new List<Task> ();
    http.Response response = await http.get(baseUrl + 'tasks/history', headers: {
      "x-access-token": Authentication.jwtToken
    });
    if (jsonDecode(response.body)['success'] == true) {
      for (var i = 0; i < jsonDecode(response.body)['tasks'].length; i++) {
        Task tmp = new Task();
        tmp.urgency = jsonDecode(response.body)['tasks'][i]['urgence'];
        tmp.importance = jsonDecode(response.body)['tasks'][i]['importance'];
        tmp.title = jsonDecode(response.body)['tasks'][i]['title'];
        tmp.description = jsonDecode(response.body)['tasks'][i]['description'];
        tmp.id = jsonDecode(response.body)['tasks'][i]['id'];
        tmp.status = jsonDecode(response.body)['tasks'][i]['status'];
        result.add(tmp);
      }
    }
    return result;
  }

  static void createTask(Task newTask) async {
    await http.post(baseUrl + 'tasks/', headers: {
      "x-access-token": Authentication.jwtToken
    }, body: {
      "urgence": newTask.urgency.toString(),
      "importance": newTask.importance.toString(),
      "title": newTask.title,
      "description": newTask.description,
      "deadline": newTask.deadline.toIso8601String(),
      "status": newTask.status,
    });
  }

  static void updateTask(Task task) async {
    await http.put(baseUrl + 'tasks/' + task.id.toString(), headers: {
      "x-access-token": Authentication.jwtToken
    }, body: {
      "urgence": task.urgency.toString(),
      "importance": task.importance.toString(),
      "title": task.title,
      "description": task.description,
      "deadline": task.deadline.toIso8601String(),
      "status": task.status,
    });
  }

  static void deleteTask(Task task) async {
    await http.delete(baseUrl + 'tasks/' + task.id.toString(), headers: {
      "x-access-token": Authentication.jwtToken
    });
  }
}