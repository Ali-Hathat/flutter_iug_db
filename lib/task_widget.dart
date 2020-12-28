
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/task_model.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  TaskWidget(this.task);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Text(task.taskName),
          Checkbox(value: task.isComplete, onChanged: null)
        ],
      ),
    );
  }

}