import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/screens/completed_tasks.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/todo_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int _currentIndex = 0;
List<Widget> screens = [HomeScreen(), TodoScreen(), CompletedTasks()];

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          _currentIndex = index;
        },
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: AppColor.background,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontFamily: 'poppins', fontSize: 12),
        fixedColor: AppColor.background,
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/images/home.svg"), label: "Home"),
          BottomNavigationBarItem(icon: SvgPicture.asset("assets/images/todo.svg"), label: "To Do"),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/completed.svg"),
            label: "Completed",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/profile.svg"),
            label: "Profile",
          ),
        ],
      ),

      body: Center(child: Text("Main Screen")),
    );
  }
}
