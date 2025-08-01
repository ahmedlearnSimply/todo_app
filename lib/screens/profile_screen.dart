import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/services/app_local_storage.dart';
import 'package:todo_app/core/theme/theme_controller.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/core/widgets/custom_svg_pic.dart';
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    loadUserData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                  child: Text(
                    "My Profile",
                    style: Theme.of(context).appBarTheme.titleTextStyle,
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
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color:
                                    ThemeController.valueNotifier.value ==
                                            ThemeMode.light
                                        ? Color(0xffD1DAD6)
                                        : Colors.transparent,
                                width: 1,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage(
                                "assets/images/boy.png",
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(60),
                                border: Border.all(
                                  color:
                                      ThemeController.valueNotifier.value ==
                                              ThemeMode.light
                                          ? Color(0xffD1DAD6)
                                          : Colors.transparent,
                                ),
                              ),
                              child: Icon(Icons.camera_alt_outlined, size: 25),
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
                  style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                    fontSize: 24,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Center(
                child: Text(
                  _quote ?? "Don't Worry Every thing is will be good",
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Gap(24),

              Text(
                "Profile Info",
                style: Theme.of(context).appBarTheme.titleTextStyle,
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
                trailing: CustomSvgPic(
                  assetName: "assets/images/arrow_back.svg",
                ),

                title: Text(
                  "User Details",
                  style: TextTheme.of(context).titleMedium,
                ),
                leading: CustomSvgPic(assetName: "assets/images/profile.svg"),
              ),
              Divider(thickness: 1),
              //Dark Mode
              ListTile(
                contentPadding: EdgeInsets.zero,

                trailing: ValueListenableBuilder(
                  valueListenable: ThemeController.valueNotifier,
                  builder: (BuildContext context, value, Widget? child) {
                    return Switch(
                      value: value == ThemeMode.dark,
                      onChanged: (bool value) {
                        ThemeController.toggleTheme();
                      },
                    );
                  },
                ),
                title: Text(
                  "Dark Mode",
                  style: TextTheme.of(context).titleMedium,
                ),
                leading: CustomSvgPic(assetName: "assets/images/moon.svg"),
              ),
              Divider(thickness: 1),
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
                  style: TextTheme.of(context).titleMedium,
                ),
                leading: CustomSvgPic(assetName: "assets/images/logout.svg"),
                trailing: CustomSvgPic(
                  assetName: "assets/images/arrow_back.svg",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
