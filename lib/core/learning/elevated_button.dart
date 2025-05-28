import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              foregroundColor: Color(0xffFFFCFC),
              backgroundColor: Color(0xff15B86C),
              fixedSize: Size(168, 40),
            ),
            onPressed: () {},
            label: Text(
              "Add New Task",
              style: TextStyle(
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
