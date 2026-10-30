import 'package:flutter/material.dart';
import 'package:studybuddy/task_item.dart';
import 'package:studybuddy/task.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final taskList = Task.taskList();

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Row(
                          children: [
                            Text("Today's Tasks"),
                            Container(
                              child: ElevatedButton(
                                child: Icon(Icons.add_circle),
                                onPressed: () => _addTask(),
                                style: ElevatedButton.styleFrom(
                                  iconColor: const Color(0xFFE97868) 
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      
                      for (Task task in taskList) 
                        TaskItem(
                          task: task,
                          onTaskChanged: _handleTaskCompletion,
                        )
                    ],
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }

  /** TODO: Implement adding task Functionality 
  *  The user should be able to: 
  *  Choose Name of Task (string)
  *  Should add a pop up dialog with text field label and 
  *  and description
  *  Task should be presented as a list (use list tiles)
  *
  * 
  */

  void _handleTaskCompletion(Task task) {
    setState(() {
      task.isDone = !task.isDone; 
    });
  }

Future<void> _addTask() async {
  final formKey = GlobalKey<FormState>();

  await showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('New Task'),
      content: Form(
        key: formKey,
        child: TextFormField(
          autofocus: true,
          decoration: const InputDecoration(labelText: 'Task Title'),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter a title';
            }
            return null;
          },
          onSaved: (value) {
            if (value != null) {
              setState(() {
                taskList.add(
                  Task(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    taskTitle: value.trim(),
                  ),
                );
              });
            }
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final state = formKey.currentState;
            if (state != null && state.validate()) {
              state.save();
              Navigator.pop(dialogContext);
            }
          },
          child: const Text('Add'),
        ),
      ],
    ),
  );
}
}