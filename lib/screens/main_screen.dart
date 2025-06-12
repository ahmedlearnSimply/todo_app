import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/screens/completed_tasks.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/profile_screen.dart';
import 'package:todo_app/screens/todo_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [HomeScreen(), TodoScreen(), CompletedTasks(), ProfileScreen()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: AppColor.background,
        unselectedItemColor: AppColor.primaryText,
        selectedItemColor: AppColor.green,
        selectedLabelStyle: TextStyle(fontFamily: 'poppins', fontSize: 12),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/home.svg",
              colorFilter:
                  _currentIndex == 0
                      ? ColorFilter.mode(AppColor.green, BlendMode.srcIn)
                      : ColorFilter.mode(AppColor.primaryText, BlendMode.srcIn),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/todo.svg",
              colorFilter:
                  _currentIndex == 1
                      ? ColorFilter.mode(AppColor.green, BlendMode.srcIn)
                      : ColorFilter.mode(AppColor.primaryText, BlendMode.srcIn),
            ),
            label: "To Do",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/completed.svg",
              colorFilter:
                  _currentIndex == 2
                      ? ColorFilter.mode(AppColor.green, BlendMode.srcIn)
                      : ColorFilter.mode(AppColor.primaryText, BlendMode.srcIn),
            ),
            label: "Completed",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/profile.svg",
              colorFilter:
                  _currentIndex == 3
                      ? ColorFilter.mode(AppColor.green, BlendMode.srcIn)
                      : ColorFilter.mode(AppColor.primaryText, BlendMode.srcIn),
            ),
            label: "Profile",
          ),
        ],
      ),

      body: screens[_currentIndex],
    );
  }
}
