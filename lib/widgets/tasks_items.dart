import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/util/color.dart';

class TasksItems extends StatelessWidget {
  TasksItems({super.key, required this.tasks, required this.isLoading, required this.onTap});

  List<TaskModel> tasks = [];
  bool isLoading = false;
  final Function(bool? value, int index) onTap;
  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty && !isLoading) {
      return Center(
        child: Text(
          "No tasks yet!",
          style: TextStyle(
            color: AppColor.primaryText,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w400,
            fontSize: 26,
          ),
        ),
      );
    }
    return ListView.separated(
      padding: EdgeInsets.only(bottom: 50),
      separatorBuilder: (BuildContext context, int index) => Gap(8),
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            height: 72,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.surface,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Checkbox(
                    activeColor: AppColor.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    value: tasks[index].isDone,

                    onChanged: (bool? value) {
                      onTap(value, index);
                    },
                  ),
                ),
                Gap(8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tasks[index].taskName,

                        style: TextStyle(
                          color: tasks[index].isDone ? Color(0xffA0A0A0) : AppColor.primaryText,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,

                          overflow: TextOverflow.ellipsis,
                          decoration:
                              tasks[index].isDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                          decorationColor: Color(0xffA0A0A0),
                        ),
                        maxLines: 1,
                      ),
                      if (tasks[index].taskDescription != "")
                        Text(
                          tasks[index].taskDescription,
                          style: TextStyle(
                            color: tasks[index].isDone ? Color(0xffA0A0A0) : AppColor.secondaryText,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                    ],
                  ),
                ),

                Gap(12),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: tasks[index].isDone ? Color(0xffA0A0A0) : Color(0xffC6C6C6),
                  ),
                ),
                Gap(5),
              ],
            ),
          ),
        );
      },
    );
  }
}
