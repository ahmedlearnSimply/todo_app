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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: [
                  Gap(16),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

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
                  Gap(100),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [
                      Gap(16),
                      Text(
                        "Welcome To Tasky",
                        style: TextStyle(
                          color: Color(0xffFFFCFC),
                          fontFamily: "plus",
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Gap(8),

                      SvgPicture.asset(
                        "assets/images/waving_hand.svg",
                        height: 42,
                        width: 42,
                      ),
                    ],
                  ),
                  Gap(8),
                  Text(
                    "Your productivity journey starts here.",
                    style: TextStyle(
                      color: Color(0xffFFFCFC),
                      fontFamily: "plus",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(24),
                  SvgPicture.asset(
                    "assets/images/person.svg",
                    width: 216,
                    height: 204,
                  ),
                  Gap(28),
                  Row(
                    children: [
                      Text(
                        "Full Name",
                        style: TextStyle(
                          color: Color(0xffFFFCFC),
                          fontFamily: "poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Gap(8),
                  TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "e.g. Sarah Khalid",
                      hintStyle: TextStyle(
                        fontFamily: 'poppins',
                        color: Color(0xff6D6D6D),
                      ),
                      fillColor: Color(0xff282828),
                      filled: true,
                    ),
                    cursorColor: Colors.white,
                  ),
                  Gap(24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(
                        double.infinity,
                        50,
                      ),
                      backgroundColor: Color(0xff15B86C),
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(
                      //     22,
                      //   ),
                      // ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Let’s Get Started",
                      style: TextStyle(
                        color: Color(0xffFFFCFC),
                        fontFamily: "poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
