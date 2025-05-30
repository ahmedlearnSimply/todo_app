import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
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

  @override
  void initState() {
    super.initState();
    loadSavedData();
    setState(() {});
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

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AddTask();
                  },
                ),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        backgroundColor: AppColor.background,

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
            ],
          ),
        ),
      ),
    );
  }
}
