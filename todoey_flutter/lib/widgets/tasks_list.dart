import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data2.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData2>(
      builder: (context, taskData2, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData2.getTask(index);
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                //print('Hello3');
                taskData2.updateTask(task);
              },
              longPressCallback: () {
                //print('Hello2');
                taskData2.deleteTask(task);
              },
            );
          },
          itemCount: taskData2.taskCount,
        );
      },
    );
  }
}
