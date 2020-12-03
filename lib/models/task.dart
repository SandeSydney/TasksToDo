import 'package:flutter/cupertino.dart';

class Task {
  /// describes how the tasks will be

  final String name;
  bool isDone;

  Task({@required this.name, this.isDone = false});

  // method to toggle the completion of a task
  void toggleDone() {
    isDone = !isDone;
  }
}
