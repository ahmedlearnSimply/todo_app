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
  List<Widget> screens = [
    HomeScreen(),
    TodoScreen(),
    CompletedTasks(),
    ProfileScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int? index) {
            setState(() {
              _currentIndex = index ?? 0;
            });
          },

          items: [
            BottomNavigationBarItem(
              icon: _buildSvgPicture("assets/images/home.svg", 0),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: _buildSvgPicture("assets/images/todo.svg", 1),
              label: "To Do",
            ),
            BottomNavigationBarItem(
              icon: _buildSvgPicture("assets/images/completed.svg", 2),
              label: "Completed",
            ),
            BottomNavigationBarItem(
              icon: _buildSvgPicture("assets/images/profile.svg", 3),
              label: "Profile",
            ),
          ],
        ),

        body: SafeArea(child: screens[_currentIndex]),
      ),
    );
  }

  SvgPicture _buildSvgPicture(String path, int index) {
    return SvgPicture.asset(
      path,
      colorFilter:
          _currentIndex == index
              ? ColorFilter.mode(
                Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
                BlendMode.srcIn,
              )
              : ColorFilter.mode(
                Theme.of(context).primaryColorDark,
                BlendMode.srcIn,
              ),
    );
  }
}
