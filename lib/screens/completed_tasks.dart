import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/widgets/tasks_items.dart';

class CompletedTasks extends StatefulWidget {
  CompletedTasks({super.key});

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  @override
  List<TaskModel> allTasks = [];
  bool isLoading = false;
  List<TaskModel> completedTasks = [];
  void initState() {
    super.initState();
    _loadTask();
  }

  void _loadTask() async {
    setState(() {
      isLoading = true;
    });
    final pref = await SharedPreferences.getInstance();

    final finalTask = pref.getString('tasks');
    if (finalTask != null) {
      final taskAfterDecode = jsonDecode(finalTask) as List<dynamic>;

      setState(() {
        allTasks = taskAfterDecode.map((e) => TaskModel.fromJson(e)).toList();
        completedTasks = allTasks.where((element) => element.isDone).toList();
      });
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Completed Tasks")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TasksItems(
          isLoading: isLoading,
          tasks: completedTasks,
          onTap: (value, index) async {
            setState(() {
              completedTasks[index].isDone = value ?? false;
            });

            await saveUpdatedTasks();
            _loadTask();
          },
        ),
      ),
    );
  }

  Future<void> saveUpdatedTasks() async {
    final pref = await SharedPreferences.getInstance();
    final updatedTasks = allTasks.map((element) => element.toJson()).toList();
    pref.setString('tasks', jsonEncode(updatedTasks));
  }
}
