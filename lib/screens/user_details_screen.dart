import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/core/widgets/custom_text_form.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({super.key});
  TextEditingController userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            CustomTextForm(
              controller: userName,
              hintText: "Ahmed Adel",
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter your name";
                }
                return null;
              },
            ),
            Gap(20),
            Text(
              "Motivation Quote",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'poppins',
                fontWeight: FontWeight.w400,
                color: AppColor.primaryText,
              ),
            ),
            Gap(8),
            CustomTextForm(
              controller: userName,
              hintText: "One task at a time. One step closer.",
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
