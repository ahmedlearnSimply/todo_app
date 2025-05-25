import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/util/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  Gap(8),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Evening ,Usama ",
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
