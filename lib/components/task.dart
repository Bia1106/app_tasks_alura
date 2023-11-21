import 'dart:math';

import 'package:app_tasks_alura/components/difficulty.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String taskName;
  final String photo;
  final int difficulty;
  const Task(this.taskName, this.photo, {super.key, required this.difficulty});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;
  Color _containerColor = Colors.blue;

  // Function to change the color
  _changeColor() {
    // Change the color to a random color
    _containerColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return _containerColor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: _containerColor,
          ),
          height: 140,
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color.fromARGB(255, 200, 230, 254),
              ),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black26,
                    ),
                    width: 72,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        widget.photo,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          widget.taskName,
                          style: const TextStyle(
                            fontSize: 24,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Difficulty(difficultyLevel: widget.difficulty),
                    ],
                  ),
                  SizedBox(
                    height: 45,
                    width: 68,
                    child: ElevatedButton(
                      onPressed: () => setState(() {
                        level++;
                        if (level == widget.difficulty * 10) {
                          level = 0;
                          _containerColor = _changeColor();
                        }
                      }),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [Icon(Icons.arrow_drop_up), Text('Up')],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 100.0,
                    top: 12.0,
                  ),
                  child: SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      color: Colors.white,
                      value: widget.difficulty > 0
                          ? (level / widget.difficulty) / 10
                          : 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Level: $level',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
