import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/core/util/color.dart';

class AchievedTasks extends StatelessWidget {
  const AchievedTasks({
    super.key,
    required this.totalDoneTasks,
    required this.totalTasks,
    required this.achievedTasks,
  });

  final int totalDoneTasks;
  final int totalTasks;
  final double achievedTasks;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(color: AppColor.surface, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Achieved Tasks",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: 'poppins',
                  color: AppColor.primaryText,
                ),
              ),
              Text(
                "$totalDoneTasks Out of $totalTasks Done",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'poppins',
                  color: AppColor.secondaryText,
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Text(
                "${(achievedTasks * 100).toStringAsFixed(0)}%",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: 'poppins',
                  color: AppColor.primaryText,
                ),
              ),

              Transform.rotate(
                angle: -pi / 1.6,
                child: SizedBox(
                  width: 48,
                  height: 48,
                  child: CircularProgressIndicator(
                    value: achievedTasks,
                    backgroundColor: Color(0xff6D6D6D),

                    valueColor: AlwaysStoppedAnimation(AppColor.green),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
