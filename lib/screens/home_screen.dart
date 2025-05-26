import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/util/color.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username;
  bool? kOnboarding;

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  void _loadUserName() async {
    final pref = await SharedPreferences.getInstance();
    username = await pref.getString("username");
    setState(() {});
  }

  void _loadOnBoarding() async {
    final pref = await SharedPreferences.getInstance();
    kOnboarding = await pref.getBool('onborading');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
