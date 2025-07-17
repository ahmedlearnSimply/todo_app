import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/services/app_local_storage.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/core/widgets/tasks_items.dart';

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

    final finalTask = AppLocalStorage.getString('tasks');
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
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Completed Tasks",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: AppColor.primaryText,
              fontFamily: 'poppins',
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
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
          ),
        ],
      ),
    );
  }

  Future<void> saveUpdatedTasks() async {
    final updatedTasks = allTasks.map((element) => element.toJson()).toList();
    AppLocalStorage.setString('tasks', jsonEncode(updatedTasks));
  }
}
