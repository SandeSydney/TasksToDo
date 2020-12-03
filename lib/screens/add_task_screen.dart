import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  // create a text editing controller
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final textController = TextEditingController();

  // creating the global key of the form
  final _formKey = GlobalKey<FormState>();

  // dispose the textController on dispose
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    // takes the user's input
//    String newTaskTitle;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                ),
              ),
              TextFormField(
                controller: textController,
                autofocus: true,
                textAlign: TextAlign.center,
                validator: (value) {
                  return value.isEmpty ? 'Please Enter some Text' : null;
                },
//              onChanged: (newText) {
//                newTaskTitle = newText;
//              },
              ),
              ElevatedButton(
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  // validate the inputs
                  if (_formKey.currentState.validate()) {
                    // add task to the list and dismiss the screen
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(textController.text);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Task added successfully'),
                    ));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
