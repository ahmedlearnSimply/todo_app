import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/learning/elevated_button.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/services/app_local_storage.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/core/widgets/custom_text_form.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({super.key});
  TextEditingController userNameController = TextEditingController();
  TextEditingController quoteController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Details")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Name",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColor.primaryText,
                        ),
                      ),
                      Gap(8),
                      CustomTextForm(
                        controller: userNameController,
                        hintText: "Ahmed Adel",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),
                      Gap(20),
                      Text(
                        "Motivation Quote",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColor.primaryText,
                        ),
                      ),
                      Gap(8),
                      CustomTextForm(
                        controller: quoteController,
                        hintText: "One task at a time. One step closer.",
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width, 40),
                ),
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final pref = await SharedPreferences.getInstance();
                    String userName = userNameController.text;
                    String motivationQuote = quoteController.text;
                    if (userName.isNotEmpty) {
                      AppLocalStorage.saveName(userName);
                    }

                    if (motivationQuote.isNotEmpty) {
                      AppLocalStorage.savemotivationQuote(motivationQuote);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Save Changes",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w500,
                    color: AppColor.primaryText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
