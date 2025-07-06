import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/widgets/tasks_items.dart';

class HighPriorityTasksWidget extends StatelessWidget {
  HighPriorityTasksWidget({super.key, required this.tasks});

  List<TaskModel> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColor.surface, borderRadius: BorderRadius.circular(20)),

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "High Priority Tasks",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'poppins',
                color: AppColor.green,
              ),
            ),
            ...tasks.take(4).map((e) {
              return Container(margin: EdgeInsets.all(10), height: 20, color: Colors.red);
            }),
          ],
        ),
      ),
    );
  }
}
