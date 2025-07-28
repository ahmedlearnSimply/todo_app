import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/services/app_local_storage.dart';
import 'package:todo_app/core/theme/dark_theme.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/screens/user_details_screen.dart';
import 'package:todo_app/screens/welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  bool isDarkMode = true;
  String? _name;
  String? _quote;
  void loadUserData() {
    setState(() {
      _name = AppLocalStorage.getName() ?? "user";
      _quote =
          AppLocalStorage.getmotivationQuote() ??
          "Don't Worry Every thing is will be good";
    });
  }

  @override
  void initState() {
    loadUserData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Center(
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
            ),
            Gap(16),
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(
                            "assets/images/ahmed.png",
                          ),
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
                _name ?? "user",
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryText,
                  fontFamily: 'poppins',
                ),
              ),
            ),
            Center(
              child: Text(
                _quote ?? "Don't Worry Every thing is will be good",
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,

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
            Gap(8),
            //user Details
            ListTile(
              onTap: () async {
                //Todo move user Details pages
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return UserDetailsScreen(
                        userName: AppLocalStorage.getName().toString(),
                        //-----------------------------------//
                        quote: _quote.toString(),
                      );
                    },
                  ),
                );
                loadUserData();
              },
              contentPadding: EdgeInsets.zero,
              trailing: SvgPicture.asset(
                "assets/images/arrow_back.svg",
                colorFilter: ColorFilter.mode(
                  Color(0xffC6C6C6),
                  BlendMode.srcIn,
                ),
              ),
              title: Text(
                "User Details",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryText,
                  fontFamily: 'poppins',
                ),
              ),
              leading: SvgPicture.asset(
                "assets/images/profile.svg",
                colorFilter: ColorFilter.mode(
                  AppColor.primaryText,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Divider(color: Color(0xff6E6E6E), thickness: 1),
            //Dark Mode
            ListTile(
              contentPadding: EdgeInsets.zero,

              trailing: Switch(
                value: AppLocalStorage.getBool(AppLocalStorage.theme) ?? true,
                onChanged: (bool value) async {
                  setState(() {
                    isDarkMode = value;

                    if (!isDarkMode) {
                      valueNotifier.value = ThemeMode.light;
                    } else {
                      valueNotifier.value = ThemeMode.dark;
                    }
                  });
                  await AppLocalStorage.setBool(AppLocalStorage.theme, value);
                },
              ),
              title: Text(
                "Dark Mode",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryText,
                  fontFamily: 'poppins',
                ),
              ),
              leading: SvgPicture.asset(
                "assets/images/moon.svg",
                colorFilter: ColorFilter.mode(
                  AppColor.primaryText,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Divider(color: Color(0xff6E6E6E), thickness: 1),
            //Log out
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () async {
                AppLocalStorage.clearUserData();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  (route) => false,
                );
              },

              title: Text(
                "Log Out",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryText,
                  fontFamily: 'poppins',
                ),
              ),
              leading: SvgPicture.asset(
                "assets/images/logout.svg",
                colorFilter: ColorFilter.mode(
                  AppColor.primaryText,
                  BlendMode.srcIn,
                ),
              ),
              trailing: SvgPicture.asset(
                "assets/images/arrow_back.svg",
                colorFilter: ColorFilter.mode(
                  Color(0xffC6C6C6),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
