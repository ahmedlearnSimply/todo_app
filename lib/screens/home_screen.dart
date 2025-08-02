import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/enum/task_item_enum.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/services/app_local_storage.dart';
import 'package:todo_app/core/theme/theme_controller.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/core/widgets/custom_svg_pic.dart';
import 'package:todo_app/screens/add_task.dart';
import 'package:todo_app/core/widgets/achieved_tasks_widget.dart';
import 'package:todo_app/core/widgets/high_priority_tasks_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = AppLocalStorage.getBool(AppLocalStorage.theme) ?? true;
  String? username;
  String? motivationQuote;
  bool? kOnboarding;
  List<TaskModel> allTasks = [];
  bool isLoading = false;

  String? emptyMessage;
  //for achieved tasks
  int totalTasks = 0;
  int totalDoneTasks = 0;
  double achievedTasks = 0;

  @override
  void initState() {
    super.initState();
    loadSavedData();
    _loadTask();
    isDarkMode = AppLocalStorage.getBool(AppLocalStorage.theme) ?? true;
  }

  void loadSavedData() {
    final name = AppLocalStorage.getName();
    final onboarding = AppLocalStorage.getKOnboarding();
    motivationQuote = AppLocalStorage.getmotivationQuote();
    setState(() {
      username = name ?? "Guest";
      kOnboarding = onboarding ?? false;
      motivationQuote =
          motivationQuote ?? "Don't Worry Every thing is will be good";
    });
  }

  void _loadTask() async {
    setState(() {
      isLoading = true;
    });
    // await Future.delayed(Duration(microseconds: 20)); : ! for loading but now i dont want it

    final finalTask = AppLocalStorage.getString('tasks');
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

  void doneTasks(bool? value, int index) async {
    setState(() {
      allTasks[index].isDone = value ?? false;
    });
    await saveUpdatedTasks();
  }

  Future<void> saveUpdatedTasks() async {
    final updatedTasks = allTasks.map((element) => element.toJson()).toList();
    AppLocalStorage.setString('tasks', jsonEncode(updatedTasks));
    calculateIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'poppins',
                fontWeight: FontWeight.w500,
              ),
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),

        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              //! ✅ HEADER — Not Scrollable
              Row(
                children: [
                  CircleAvatar(
                    radius: 21,
                    backgroundImage: AssetImage("assets/images/ahmed.png"),
                  ),
                  Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,

                          "Good Evening , $username",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          motivationQuote.toString(),
                          maxLines: 1,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  //!--------------------------------------------------------!//
                  GestureDetector(
                    onTap: () {
                      ThemeController.toggleTheme();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).primaryColor,
                      ),
                      width: 34,
                      height: 34,
                      child: Center(
                        child: SvgPicture.asset(
                          ThemeController.valueNotifier.value == ThemeMode.dark
                              ? "assets/images/sun.svg"
                              : "assets/images/moon.svg",
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).primaryColorDark,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(child: Gap(16)),
                    //!Yuhuu ,Your work Is
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Yuhuu ,Your work Is ",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Row(
                            children: [
                              Text(
                                "almost done ! ",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              CustomSvgPic.withoutColor(
                                assetName: "assets/images/waving_hand.svg",
                                width: 32,
                                height: 32,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(child: Gap(16)),
                    SliverToBoxAdapter(
                      child: AchievedTasks(
                        totalDoneTasks: totalDoneTasks,
                        totalTasks: totalTasks,
                        achievedTasks: achievedTasks,
                      ),
                    ),

                    SliverToBoxAdapter(child: Gap(8)),

                    //!High Priority Tasks
                    allTasks.where((e) => e.isHighPriority).isNotEmpty
                        ? SliverToBoxAdapter(
                          child: HighPriorityTasksWidget(
                            tasks: allTasks,
                            onTap: (value, index) {
                              doneTasks(value, index);
                            },
                            refresh: () {
                              _loadTask();
                            },
                          ),
                        )
                        : SliverToBoxAdapter(child: SizedBox()),
                    SliverToBoxAdapter(child: Gap(24)),
                    //! my tasks
                    SliverToBoxAdapter(
                      child: Text(
                        "My Tasks",
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(fontSize: 20),
                      ),
                    ),
                    SliverToBoxAdapter(child: Gap(16)),
                    SliverPadding(
                      padding: EdgeInsets.only(bottom: 80),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              height: 72,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? AppColor.background
                                          : Color(0xffD1DAD6),
                                ),
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.primaryContainer,
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

                                      onChanged: (bool? value) {
                                        doneTasks(value, index);
                                      },
                                    ),
                                  ),
                                  Gap(8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        //-------------------//
                                        Text(
                                          allTasks[index].taskName,
                                          //!-----//
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium!.copyWith(
                                            color:
                                                allTasks[index].isDone
                                                    ? Theme.of(
                                                      context,
                                                    ).disabledColor
                                                    : Theme.of(
                                                      context,
                                                    ).hintColor,
                                            overflow: TextOverflow.ellipsis,
                                            decoration:
                                                allTasks[index].isDone
                                                    ? TextDecoration.lineThrough
                                                    : TextDecoration.none,
                                            decorationColor:
                                                Theme.of(context).disabledColor,
                                          ),

                                          //!-----//
                                          maxLines: 1,
                                        ),
                                        if (allTasks[index].taskDescription !=
                                            "")
                                          Text(
                                            allTasks[index].taskDescription,
                                            style:
                                                Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(),

                                            maxLines: 1,
                                          ),
                                      ],
                                    ),
                                  ),

                                  Gap(12),
                                  PopupMenuButton<TaskItemEnum>(
                                    itemBuilder:
                                        (context) =>
                                            TaskItemEnum.values.map((e) {
                                              return PopupMenuItem(
                                                value: e,
                                                child: Text(e.name),
                                              );
                                            }).toList(),
                                    onSelected: (value) {
                                      switch (value) {
                                        case TaskItemEnum.delete:
                                          print("Delete");
                                          break;
                                        case TaskItemEnum.edit:
                                          print("Edit");
                                          break;
                                        case TaskItemEnum.markAsDone:
                                          print("Mark as Done");
                                          break;
                                      }
                                    },
                                    child: Icon(
                                      Icons.more_vert,
                                      color:
                                          allTasks[index].isDone
                                              ? Theme.of(context).cardColor
                                              : Theme.of(
                                                context,
                                              ).primaryColorDark,
                                    ),
                                  ),

                                  Gap(20),
                                ],
                              ),
                            ),
                          );
                        }, childCount: allTasks.length),
                      ),
                    ),
                    if (allTasks.isEmpty && !isLoading)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50),
                          child: Center(
                            child: Text(
                              "No Task Found",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'poppins',
                                color: AppColor.primaryText,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
