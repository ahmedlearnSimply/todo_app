import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/widgets/tasks_items.dart';

class HighPriorityScreen extends StatefulWidget {
  const HighPriorityScreen({super.key});

  @override
  State<HighPriorityScreen> createState() => _HighPriorityScreenState();
}

class _HighPriorityScreenState extends State<HighPriorityScreen> {
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
            allTasks.where((element) => element.isHighPriority).toList().reversed.toList();
      });
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("High Priority Tasks"),
      ),
      body: Padding(
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
                    // Save changes and reload from shared preferences
                    final pref = await SharedPreferences.getInstance();
                    final updatedTasks = allTasks.map((e) => e.toJson()).toList();
                    await pref.setString('tasks', jsonEncode(updatedTasks));
                    _loadTask();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
