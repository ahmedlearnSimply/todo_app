import 'package:flutter/material.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/screens/home_screen.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: SizedBox(
          height: 44,
          width: 168,
          child: FloatingActionButton.extended(
            elevation: 0,
            foregroundColor: AppColor.primaryText,
            backgroundColor: AppColor.green,
            icon: Icon(Icons.add, size: 18),

            label: Text(
              "Add New Task",
              style: TextStyle(
                fontSize: 14,

                fontFamily: 'poppins',
                fontWeight: FontWeight.w500,
              ),
            ),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return HomeScreen();
                  },
                ),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        body: Center(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              foregroundColor: Color(0xffFFFCFC),
              backgroundColor: AppColor.green,
              fixedSize: Size(168, 40),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return HomeScreen();
                  },
                ),
              );
            },
            label: Text(
              "Add New Task",
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'poppins',
                fontWeight: FontWeight.w500,
              ),
            ),

            icon: Icon(Icons.add, size: 18),
          ),
        ),
      ),
    );
  }
}
