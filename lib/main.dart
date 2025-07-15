// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/services/app_local_storage.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/screens/main_screen.dart';
import 'package:todo_app/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // important line for shared preferences
  final pref = await SharedPreferences.getInstance();
  await AppLocalStorage.init();
  // pref.clear();
  final isFirstTime = await AppLocalStorage.getKOnboarding() ?? false;
  runApp(MainApp(isFirstTime: isFirstTime));
}

class MainApp extends StatelessWidget {
  final bool isFirstTime;
  MainApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColor.green),
            foregroundColor: WidgetStateProperty.all(AppColor.primaryText),
          ),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColor.primaryText;
            }
            return Color(0xff9E9E9E);
          }),
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColor.green;
            }
            return Colors.transparent;
          }),
          trackOutlineColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.transparent;
            }
            return Color(0xff9E9E9E);
          }),
          trackOutlineWidth: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return 0;
            }
            return 2;
          }),
        ),
        scaffoldBackgroundColor: AppColor.background,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColor.primaryText),
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w400,
            color: AppColor.primaryText,
          ),
          surfaceTintColor: AppColor.background,
          backgroundColor: AppColor.background,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: !isFirstTime ? MainScreen() : WelcomeScreen(),
    );
  }
}
