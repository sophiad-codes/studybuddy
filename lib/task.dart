class Task {
  String? id;
  String? taskTitle;
  String? taskDescription;
  bool isDone;

  Task({
    required this.id,
    required this.taskTitle,
    this.isDone = false 
  });

  static List<Task> taskList () {
    return [
      Task(id: '1', taskTitle: 'task1', isDone: false),
      Task(id: '2', taskTitle: 'task2', isDone: true),
      Task(id: '3', taskTitle: 'task3', isDone: true),
    ];
  }
}
