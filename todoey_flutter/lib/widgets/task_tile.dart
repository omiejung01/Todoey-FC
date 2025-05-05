import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;

  const TaskTile(
      {
        super.key,
        this.isChecked=false,
        this.taskTitle='',
        required this.checkboxCallback,
        required this.longPressCallback
      });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: true,
      onLongPress: () {
        //print('Hello');
        longPressCallback();
      },
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (value) {
          checkboxCallback(value);
        },
      ),
    );
  }
}
