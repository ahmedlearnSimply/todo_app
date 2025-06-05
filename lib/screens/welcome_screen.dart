import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/services/app_local_storage.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  final TextEditingController textController =
      TextEditingController();

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(
          context,
        ).unfocus(); // to remove keyboard when you press on pixel in screen
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.background,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                child: Form(
                  key: _formKey,
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
                              color: AppColor.primaryText,
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
                          color: AppColor.primaryText,
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
                              color: AppColor.primaryText,
                              fontFamily: "poppins",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Gap(8),
                      TextFormField(
                        controller: textController,
                        validator: (String? value) {
                          if (value == null ||
                              value.trim().isEmpty) {
                            return "Enter Your Full Name";
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'poppins',
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(16),
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
                            MediaQuery.of(
                              context,
                            ).size.width,
                            50,
                          ),
                          backgroundColor: AppColor.green,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!
                              .validate()) {
                            await AppLocalStorage.saveName(
                              textController.value.text,
                            );
                            log(textController.value.text);
                            await AppLocalStorage.saveOnboarding(
                              true,
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (
                                  BuildContext context,
                                ) {
                                  return HomeScreen();
                                },
                              ),
                            );
                          }
                        },
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
        ),
      ),
    );
  }
}
