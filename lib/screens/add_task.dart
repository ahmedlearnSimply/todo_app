import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/util/color.dart';

class AddTask extends StatefulWidget {
  AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  //Some Vars
  final TextEditingController taskNameController = TextEditingController();

  final TextEditingController desController = TextEditingController();

  bool isHighPriority = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //TODO : Don't Forget to dispose the controllers
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("New Task")),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Gap(8),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Task Name",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w400,
                                color: AppColor.primaryText,
                              ),
                            ),
                          ),
                          Gap(8),

                          TextFormField(
                            validator: (String? value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Please Enter Name Of Task ";
                              }
                              return null;
                            },
                            controller: taskNameController,
                            cursorColor: Colors.white,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'poppins',
                              fontSize: 18,
                            ),

                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: AppColor.surface,
                              filled: true,
                              hintText: "Finish Shooting Unit one",
                              hintStyle: TextStyle(
                                fontFamily: 'poppins',
                                color: Color(0xff6D6D6D),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Gap(20),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Task Description",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w400,
                                color: AppColor.primaryText,
                              ),
                            ),
                          ),
                          Gap(8),
                          TextFormField(
                            controller: desController,
                            cursorColor: Colors.white,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'poppins',
                              fontSize: 18,
                            ),
                            maxLines: 5,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: AppColor.surface,
                              filled: true,
                              hintText: "From Data Structure Course at Next Friday.",
                              hintStyle: TextStyle(
                                fontFamily: 'poppins',
                                color: Color(0xff6D6D6D),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "High Priority",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primaryText,
                                ),
                              ),
                              Switch(
                                value: isHighPriority,
                                activeTrackColor: AppColor.green,

                                onChanged: (value) {
                                  setState(() {
                                    isHighPriority = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColor.primaryText,
                      backgroundColor: AppColor.green,
                      fixedSize: Size(MediaQuery.of(context).size.width, 40),
                    ),
                    icon: Icon(Icons.add),
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        TaskModel task = TaskModel(
                          taskName: taskNameController.text,
                          taskDescription: desController.text,
                          isHighPriority: isHighPriority,
                        );
                        final pref = await SharedPreferences.getInstance();
                        final taskJson = pref.getString('tasks');
                        List<dynamic> taskList = [];

                        if (taskJson != null) {
                          taskList = jsonDecode(taskJson);
                        }

                        taskList.add(task.toJson());

                        final taskEncode = jsonEncode(taskList);
                        await pref.setString('tasks', taskEncode);
                        Navigator.pop(context);
                      }
                    },

                    label: Text(
                      "Add Task",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.primaryText,
                      ),
                    ),
                  ),
                  Gap(8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
