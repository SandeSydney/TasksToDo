import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  // variable to hold state of the checkbox
  final bool isChecked;
  // variable to hold value of the task title
  final String taskTitle;
  // function variable to toggle state of checkbox
  final Function checkboxCallback;
  // function to delete a task on long press
  final Function deleteTaskCallback;

  TaskTile(
      {this.taskTitle,
      this.isChecked,
      this.checkboxCallback,
      this.deleteTaskCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: GestureDetector(
        onTap: deleteTaskCallback,
        child: Icon(
          Icons.delete_outline,
        ),
      ),
    );
  }
}
