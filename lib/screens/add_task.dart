import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/util/color.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: AppColor.background,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/images/arrowback.svg",
            width: 16,
            height: 16,
          ),
          color: AppColor.primaryText,
        ),
      ),
      body: Column(),
    );
  }
}
