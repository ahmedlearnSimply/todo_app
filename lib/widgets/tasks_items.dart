import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/util/color.dart';

class TasksItems extends StatefulWidget {
  TasksItems({super.key});

  @override
  State<TasksItems> createState() => _TasksItemsState();
}

class _TasksItemsState extends State<TasksItems> {
  List<TaskModel> allTasks = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadTask();
  }

  void _loadTask() async {
    setState(() {
      isLoading = true;
    });
    // await Future.delayed(Duration(microseconds: 20)); : ! for loading but now i dont want it
    final pref = await SharedPreferences.getInstance();

    final finalTask = pref.getString('tasks');
    if (finalTask != null) {
      final taskAfterDecode = jsonDecode(finalTask) as List<dynamic>;

      setState(() {
        allTasks = taskAfterDecode.map((e) => TaskModel.fromJson(e)).toList();
        isLoading = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return allTasks.isNotEmpty
        ? Expanded(
          child:
              isLoading
                  ? Center(child: CircularProgressIndicator(color: Colors.white))
                  : ListView.separated(
                    padding: EdgeInsets.only(bottom: 50),
                    separatorBuilder: (BuildContext context, int index) => Gap(8),
                    itemCount: allTasks.length,
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
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  value: allTasks[index].isDone,

                                  onChanged: (value) async {
                                    setState(() {
                                      allTasks[index].isDone = value ?? false;
                                    });

                                    final pref = await SharedPreferences.getInstance();
                                    final updatedTasks =
                                        allTasks.map((element) => element.toJson()).toList();
                                    pref.setString('tasks', jsonEncode(updatedTasks));
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
                                      allTasks[index].taskName,

                                      style: TextStyle(
                                        color:
                                            allTasks[index].isDone
                                                ? Color(0xffA0A0A0)
                                                : AppColor.primaryText,
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,

                                        overflow: TextOverflow.ellipsis,
                                        decoration:
                                            allTasks[index].isDone
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                        decorationColor: Color(0xffA0A0A0),
                                      ),
                                      maxLines: 1,
                                    ),
                                    if (allTasks[index].taskDescription != "")
                                      Text(
                                        allTasks[index].taskDescription,
                                        style: TextStyle(
                                          color:
                                              allTasks[index].isDone
                                                  ? Color(0xffA0A0A0)
                                                  : AppColor.secondaryText,
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
                                  color:
                                      allTasks[index].isDone
                                          ? Color(0xffA0A0A0)
                                          : Color(0xffC6C6C6),
                                ),
                              ),
                              Gap(5),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
        )
        : Center(
          child: Text(
            "There is No Task ",

            style: TextStyle(
              color: AppColor.primaryText,
              fontFamily: 'poppins',
              fontWeight: FontWeight.w400,
              fontSize: 26,

              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
        );
  }
}
