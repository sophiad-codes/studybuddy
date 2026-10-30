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
                                onPressed: () {},
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

  //List<Task> tasks = [];
  void _addTask(String title, String description) {
    setState(() {
      taskList.add(Task(id: DateTime.now().millisecond.toString(), 
      taskTitle: title
      )
      );
    });
    
  }
}