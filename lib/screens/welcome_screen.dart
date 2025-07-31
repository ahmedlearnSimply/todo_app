import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/services/app_local_storage.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/core/widgets/custom_svg_pic.dart';
import 'package:todo_app/core/widgets/custom_text_form.dart';
import 'package:todo_app/screens/main_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  final TextEditingController textController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          CustomSvgPic.withoutColor(
                            assetName: "assets/images/logo.svg",
                          ),
                          // SvgPicture.asset(
                          //   "assets/images/logo.svg",
                          //   height: 42,
                          //   width: 42,
                          // ),
                          Gap(16),
                          Text(
                            "Tasky",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ],
                      ),
                      Gap(100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Gap(16),
                          Text(
                            "Welcome To Tasky",
                            style: Theme.of(context).textTheme.displayMedium,
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
                        style: Theme.of(context).textTheme.displaySmall,
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
                            style: Theme.of(context).textTheme.displaySmall!
                                .copyWith(fontFamily: 'poppins'),
                          ),
                        ],
                      ),
                      Gap(8),
                      CustomTextForm(
                        controller: textController,
                        hintText: "e.g. Ahmed Adel",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please Enter Your Full Name";
                          } else {
                            return null;
                          }
                        },
                      ),

                      Gap(24),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                            MediaQuery.of(context).size.width,
                            50,
                          ),
                          backgroundColor: AppColor.green,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await AppLocalStorage.saveName(
                              textController.value.text,
                            );
                            log(textController.value.text);
                            await AppLocalStorage.saveOnboarding(true);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return MainScreen();
                                },
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Please Enter Your Full Name",
                                  style: TextStyle(fontFamily: 'poppins'),
                                ),
                                backgroundColor: AppColor.green,
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
