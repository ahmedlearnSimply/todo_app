// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:todo_app/core/learning/elevated_button.dart';
import 'package:todo_app/core/services/app_local_storage.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isFirstTime =
      await AppLocalStorage.getKOnboarding() ?? false;
  runApp(MainApp(isFirstTime: isFirstTime));
}

class MainApp extends StatelessWidget {
  final bool isFirstTime;
  MainApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: isFirstTime ? HomeScreen() : WelcomeScreen(),
      home: CustomElevatedButton(),
    );
  }
}
