import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff181818),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SvgPicture.asset(
                  "assets/images/logo.svg",
                  height: 42,
                  width: 42,
                ),
                Gap(16),
                Text(
                  "Tasky",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "plus",
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
