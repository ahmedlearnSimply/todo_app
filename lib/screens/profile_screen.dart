import 'package:flutter/material.dart';
import 'package:todo_app/core/util/color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text(
            "My Profile",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: AppColor.primaryText,
              fontFamily: 'poppins',
            ),
          ),
        ],
      ),
    );
  }
}
