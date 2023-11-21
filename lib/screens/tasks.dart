import 'package:app_tasks_alura/components/task.dart';
import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  bool opacity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          'Tasks',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 2000),
        child: ListView(
          children: const [
            Task('Learn Flutter', 'assets/images/dash.png', difficulty: 2),
            Task('Learn how to ride a bike', 'assets/images/meditation.jpeg',
                difficulty: 1),
            Task('Practice meditation', 'assets/images/dash.png',
                difficulty: 4),
            Task('Practice meditation', 'assets/images/dash.png',
                difficulty: 2),
            Task('Practice meditation', 'assets/images/dash.png',
                difficulty: 2),
            Task('Practice meditation', 'assets/images/dash.png',
                difficulty: 3),
            Task('Practice meditation', 'assets/images/dash.png',
                difficulty: 1),
            Task('Practice meditation', 'assets/images/dash.png',
                difficulty: 5),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => opacity = !opacity),
        child: const Icon(
          Icons.remove_red_eye,
        ),
      ),
    );
  }
}
