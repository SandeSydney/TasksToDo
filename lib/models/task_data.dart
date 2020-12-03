import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_app/models/task.dart';

class TaskData extends ChangeNotifier {
  /// class that provides an app level change notifier and updated with the
  /// Listener Widgets

  // List of tasks
  List<Task> _tasks = [];

  // create a getter to return a public version of the private tasks list
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  // getter method to get number of items in the tasks List
  int get taskCount {
    return _tasks.length;
  }

  // method to add new tasks
  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  // method to update the tasks, strike through and check the checkbox
  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  //  method to delete a task when a list tile is long pressed
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
