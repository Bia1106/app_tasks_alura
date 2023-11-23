import 'package:app_tasks_alura/components/task.dart';
import 'package:app_tasks_alura/data/database.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String _tablename = 'taskTable';
  static const String _name = 'taskName';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  save(Task task) async {
    debugPrint("Accessing method save: ");
    final Database db = await getDatabase();
    var itemExists = await find(task.taskName);
    Map<String, dynamic> taskMap = toMap(task);
    if (itemExists.isEmpty) {
      debugPrint("Task didn't exist");
      return await db.insert(
        _tablename,
        taskMap,
      );
    } else {
      debugPrint("The task already existed");
      return await db.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [task.taskName],
      );
    }
  }

  Future<List<Task>> findAll() async {
    debugPrint("Accessing method findAll: ");
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    debugPrint("Searching data in the data base... Found: $result");
    return toList(result);
  }

  Future<List<Task>> find(String taskName) async {
    debugPrint("Accessing method findAll: ");
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
        await db.query(_tablename, where: '$_name = ?', whereArgs: [taskName]);
    debugPrint("Searching data in the data base... Found: ${toList(result)}");
    return toList(result);
  }

  delete(String taskName) async {
    debugPrint("Deleting task $taskName");
    final Database db = await getDatabase();
    return db.delete(_tablename, where: '$_name = ?', whereArgs: [taskName]);
  }

  List<Task> toList(List<Map<String, dynamic>> tasksList) {
    debugPrint("Converting to a list");
    final List<Task> tasks = [];
    for (Map<String, dynamic> line in tasksList) {
      final Task task =
          Task(line[_name], line[_image], difficulty: line[_difficulty]);
      tasks.add(task);
    }
    debugPrint('Task list $tasks');
    return tasks;
  }

  Map<String, dynamic> toMap(Task task) {
    debugPrint("Converting to a map");
    final Map<String, dynamic> tasksMap = {};
    tasksMap[_name] = task.taskName;
    tasksMap[_image] = task.photo;
    tasksMap[_difficulty] = task.difficulty;
    debugPrint('Task map $tasksMap');
    return tasksMap;
  }
}
