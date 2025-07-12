import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/core/widgets/tasks_items.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  List<TaskModel> allTasks = [];
  bool isLoading = false;
  List<TaskModel> checkedTasks = [];
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
        checkedTasks =
            allTasks.where((element) => element.isDone == false).toList();
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
            "To Do Tasks",
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
                tasks: checkedTasks,
                onTap: (value, index) async {
                  setState(() {
                    checkedTasks[index].isDone = value ?? false;
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
    final pref = await SharedPreferences.getInstance();
    final updatedTasks = allTasks.map((element) => element.toJson()).toList();
    pref.setString('tasks', jsonEncode(updatedTasks));
  }
}
