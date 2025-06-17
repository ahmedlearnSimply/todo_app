import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/services/app_local_storage.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Text(
              "My Profile",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColor.primaryText,
                fontFamily: 'poppins',
              ),
            ),
          ),
          Gap(16),
          Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    //? Todo : put the logic of how can user change the photo
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("assets/images/ahmed.png"),
                        backgroundColor: Colors.transparent,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppColor.surface,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: AppColor.primaryText,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gap(2),
          Center(
            child: Text(
              AppLocalStorage.getName().toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: AppColor.primaryText,
                fontFamily: 'poppins',
              ),
            ),
          ),
          Center(
            child: Text(
              "One task at a time. One step closer.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.secondaryText,
                fontFamily: 'poppins',
              ),
            ),
          ),
          Gap(24),
          Text(
            "Profile Info",
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
