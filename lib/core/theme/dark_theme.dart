import 'package:flutter/material.dart';
import 'package:todo_app/core/util/color.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColor.background,
  colorScheme: ColorScheme.dark(primaryContainer: AppColor.surface),
  disabledColor: Color(0xff6A6A6A),
  //Text Theme
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: AppColor.primaryText,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400,
      fontSize: 32,
    ),
    titleMedium: TextStyle(
      color: AppColor.primaryText,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      color: Color(0xffC6C6C6),
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    labelSmall: TextStyle(
      color: Colors.white,
      fontFamily: 'poppins',
      fontSize: 18,
      fontWeight: FontWeight.normal,
    ),
    displayLarge: TextStyle(
      color: Colors.white,
      fontFamily: "plus",
      fontSize: 28,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      color: AppColor.primaryText,
      fontFamily: "plus",
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      color: AppColor.primaryText,
      fontFamily: "plus",
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),

  //text input decoration
  inputDecorationTheme: InputDecorationTheme(
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 0.7),
      borderRadius: BorderRadius.circular(16),
    ),
    fillColor: AppColor.surface,
    filled: true,
    hintStyle: TextStyle(
      fontFamily: 'poppins',
      color: Color(0xff6D6D6D),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),

      borderSide: BorderSide.none,
    ),
  ),
  //elevatedButton Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColor.green),
      foregroundColor: WidgetStateProperty.all(AppColor.primaryText),
    ),
  ),
  //Appbar Theme
  appBarTheme: AppBarTheme(
    centerTitle: true,
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
  //Swith Theme
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
);
