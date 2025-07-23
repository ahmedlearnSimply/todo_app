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

      decoration: BoxDecoration(
        border: Border.all(
          color:
              Theme.of(context).brightness == Brightness.dark
                  ? AppColor.background
                  : Color(0xffD1DAD6),
        ),
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Achieved Tasks",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "$totalDoneTasks Out of $totalTasks Done",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Text(
                "${(achievedTasks * 100).toStringAsFixed(0)}%",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
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
