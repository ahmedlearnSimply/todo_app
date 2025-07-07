import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/services/app_local_storage.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/screens/add_task.dart';
import 'package:todo_app/widgets/achieved_tasks_widget.dart';
import 'package:todo_app/widgets/high_priority_tasks_widget.dart';
import 'package:todo_app/widgets/tasks_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username;
  bool? kOnboarding;
  List<TaskModel> allTasks = [];
  bool isLoading = false;

  //for achieved tasks
  int totalTasks = 0;
  int totalDoneTasks = 0;
  double achievedTasks = 0;

  @override
  void initState() {
    super.initState();
    loadSavedData();
    _loadTask();
  }

  void loadSavedData() async {
    final name = await AppLocalStorage.getName();
    final onboarding = await AppLocalStorage.getKOnboarding();

    setState(() {
      username = name ?? "Guest";
      kOnboarding = onboarding ?? false;
    });
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
        calculateIndicator();
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  void calculateIndicator() {
    totalTasks = allTasks.length;
    totalDoneTasks = allTasks.where((element) => element.isDone).length;
    achievedTasks = (totalTasks == 0) ? 0 : totalDoneTasks / totalTasks;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        floatingActionButton: SizedBox(
          height: 40,
          width: 168,
          child: FloatingActionButton.extended(
            elevation: 0,
            foregroundColor: AppColor.primaryText,
            backgroundColor: AppColor.green,
            icon: Icon(Icons.add, size: 18),

            label: Text(
              "Add New Task",
              style: TextStyle(fontSize: 14, fontFamily: 'poppins', fontWeight: FontWeight.w500),
            ),

            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AddTask();
                  },
                ),
              );
              _loadTask();
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 21, backgroundImage: AssetImage("assets/images/ahmed.png")),
                  Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Evening , $username",
                        style: TextStyle(
                          color: AppColor.primaryText,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "One task at a time.One step closer. ",
                        style: TextStyle(
                          color: AppColor.secondaryText,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColor.surface,
                    ),
                    width: 34,
                    height: 34,
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/images/sun.svg",
                        colorFilter: ColorFilter.mode(AppColor.primaryText, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ],
              ),

              Gap(16),

              Text(
                "Yuhuu ,Your work Is ",
                style: TextStyle(
                  color: AppColor.primaryText,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 32,
                ),
              ),
              Row(
                children: [
                  Text(
                    "almost done ! ",
                    style: TextStyle(
                      color: AppColor.primaryText,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                    ),
                  ),
                  SvgPicture.asset("assets/images/waving_hand.svg", width: 32, height: 32),
                ],
              ),
              Gap(24),
              // /Achieved Tasks
              AchievedTasks(
                totalDoneTasks: totalDoneTasks,
                totalTasks: totalTasks,
                achievedTasks: achievedTasks,
              ),
              Gap(8),

              //High Priority Tasks
              allTasks.where((e) => e.isHighPriority).isNotEmpty
                  ? HighPriorityTasksWidget(
                    tasks: allTasks,
                    onTap: (value, index) async {
                      setState(() {
                        allTasks[index].isDone = value ?? false;
                      });
                      await saveUpdatedTasks();
                    },
                  )
                  : SizedBox(),

              // my tasks
              Text(
                "My Tasks",
                style: TextStyle(
                  color: AppColor.primaryText,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              Gap(16),
              Expanded(
                child: TasksItems(
                  isLoading: isLoading,
                  tasks: allTasks,
                  onTap: (value, index) async {
                    setState(() {
                      allTasks[index].isDone = value ?? false;
                    });

                    await saveUpdatedTasks();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveUpdatedTasks() async {
    final pref = await SharedPreferences.getInstance();
    final updatedTasks = allTasks.map((element) => element.toJson()).toList();
    pref.setString('tasks', jsonEncode(updatedTasks));
    calculateIndicator();
  }
}
