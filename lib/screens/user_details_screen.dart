import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/services/app_local_storage.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/core/widgets/custom_text_form.dart';

class UserDetailsScreen extends StatefulWidget {
  UserDetailsScreen({super.key, required this.quote, required this.userName});
  final String userName;
  final String quote;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late TextEditingController userNameController;
  late TextEditingController quoteController;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    userNameController = TextEditingController(text: widget.userName);
    quoteController = TextEditingController(text: widget.quote);

    super.initState();
  }

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
                    String userName = userNameController.text;
                    String motivationQuote =
                        quoteController.text ?? "motivationQuote";

                    AppLocalStorage.saveName(userName);

                    AppLocalStorage.savemotivationQuote(motivationQuote);
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
