import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/services/app_local_storage.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/screens/add_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username;
  bool? kOnboarding;
  List<TaskModel> allTasks = [];

  @override
  void initState() {
    super.initState();
    loadSavedData();
    _loadTask();
  }

  void loadSavedData() async {
    final name = await AppLocalStorage.getName();
    final onboarding =
        await AppLocalStorage.getKOnboarding();

    setState(() {
      username = name ?? "Guest";
      kOnboarding = onboarding ?? false;
    });
  }

  void _loadTask() async {
    final pref = await SharedPreferences.getInstance();
    final finalTask = pref.getString('tasks');
    if (finalTask != null) {
      final taskAfterDecode =
          jsonDecode(finalTask) as List<dynamic>;
      log(taskAfterDecode.toString());

      setState(() {
        allTasks =
            taskAfterDecode
                .map((e) => TaskModel.fromJson(e))
                .toList();
      });
    }
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 21,
                    backgroundImage: AssetImage(
                      "assets/images/ahmed.png",
                    ),
                  ),
                  Gap(10),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
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
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                      color: AppColor.surface,
                    ),
                    width: 34,
                    height: 34,
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/images/sun.svg",
                        colorFilter: ColorFilter.mode(
                          AppColor.primaryText,
                          BlendMode.srcIn,
                        ),
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
                  SvgPicture.asset(
                    "assets/images/waving_hand.svg",
                    width: 32,
                    height: 32,
                  ),
                ],
              ),
              if (allTasks.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: allTasks.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Container(
                          height: 72,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColor.surface,
                            borderRadius:
                                BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (onChanged) {},
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,

                                children: [
                                  Text(
                                    allTasks[index]
                                        .taskName,

                                    style: TextStyle(
                                      color:
                                          AppColor
                                              .primaryText,
                                      fontFamily: 'poppins',
                                      fontWeight:
                                          FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    allTasks[index]
                                        .taskName,
                                    style: TextStyle(
                                      color:
                                          AppColor
                                              .secondaryText,
                                      fontFamily: 'poppins',
                                      fontWeight:
                                          FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.settings),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
