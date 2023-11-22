import 'package:app_tasks_alura/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;
  final List<Task> taskList = [
    Task('Learn Flutter', 'assets/images/dash.png', difficulty: 2),
    Task('Learn how to ride a bike', 'assets/images/meditation.jpeg',
        difficulty: 1),
    Task('Practice meditation', 'assets/images/dash.png', difficulty: 4),
    Task('Practice meditation', 'assets/images/dash.png', difficulty: 2),
    Task('Practice meditation', 'assets/images/dash.png', difficulty: 2),
    Task('Practice meditation', 'assets/images/dash.png', difficulty: 3),
    Task('Practice meditation', 'assets/images/dash.png', difficulty: 1),
    Task('Practice meditation', 'assets/images/dash.png', difficulty: 5),
  ];

  newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty: difficulty));
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    // tem o poder de pegar o estado antigo de uma variável usando o odlWidget.variavel.infomacaoDesejada comparado ao estado atual
    // variavel.informacaoDesejada
    return oldWidget.taskList.length != taskList.length;
  }
}
