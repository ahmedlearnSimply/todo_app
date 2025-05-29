import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/util/color.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          title: Text(
            "New Task",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'poppins',
              fontWeight: FontWeight.w400,
              color: AppColor.primaryText,
            ),
          ),
          iconTheme: IconThemeData(
            color: AppColor.primaryText,
          ),
          backgroundColor: AppColor.background,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Task Name",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryText,
                ),
              ),
              Gap(8),
            ],
          ),
        ),
      ),
    );
  }
}
