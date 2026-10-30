import 'package:flutter/material.dart';
import 'package:studybuddy/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final onTaskChanged; 

  const TaskItem({super.key, required this.task, this.onTaskChanged});

  @override
  Widget build (BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          onTaskChanged(task);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        tileColor: Colors.white,
        leading: Icon(
          task.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.green
        ),
        title: Text(
          task.taskTitle!,
          style: TextStyle(
            decoration: task.isDone? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
  
}