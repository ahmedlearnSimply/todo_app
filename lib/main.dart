// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:todo_app/core/services/app_local_storage.dart';
import 'package:todo_app/core/theme/dark_theme.dart';
import 'package:todo_app/core/theme/light_theme.dart';
import 'package:todo_app/screens/main_screen.dart';
import 'package:todo_app/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // important line for shared preferences
  await AppLocalStorage.init();
  // pref.clear();
  final isFirstTime = AppLocalStorage.getKOnboarding() ?? false;
  runApp(MainApp(isFirstTime: isFirstTime));
}

class MainApp extends StatelessWidget {
  final bool isFirstTime;
  MainApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: isFirstTime ? WelcomeScreen() : MainScreen(),
    );
  }
}
