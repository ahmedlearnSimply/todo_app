import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/widgets/tasks_items.dart';

class HighPriorityTasksWidget extends StatelessWidget {
  HighPriorityTasksWidget({super.key, required this.tasks, required this.onTap});

  final Function(bool? value, int index) onTap;
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
            ...tasks.where((e) => e.isHighPriority).take(4).map((element) {
              return Row(
                children: [
                  Checkbox(
                    activeColor: AppColor.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    value: element.isDone,
                    onChanged: (bool? value) {
                      final indexInAllTasks = tasks.indexWhere((e) => e.id == element.id);

                      onTap(value, indexInAllTasks);
                    },
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
