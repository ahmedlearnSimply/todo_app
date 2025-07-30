import 'package:flutter/material.dart';
import 'package:todo_app/core/util/color.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xffF6F7F9),
  colorScheme: ColorScheme.light(
    primaryContainer: Color(0xffFFFFFF),
    secondary: AppColor.primaryText,
    primaryFixed: Color(0xff161F1B),
  ),
  disabledColor: Color(0xff6A6A6A),
  hintColor: Color(0xff161F1B),
  primaryColorDark: Color(0xff3A4640),
  cardColor: Color(0xff6A6A6A),
  primaryColor: Color(0xffFFFFFF),
  shadowColor: Color(0xffD1DAD6),

  // onBackground: Color(0xff161F1B),

  //check box theme
  checkboxTheme: CheckboxThemeData(
    checkColor: WidgetStateProperty.all(Colors.white),

    side: BorderSide(
      color: Color(0xffD1DAD6),
      width: 2, // border width
    ),
  ),
  //Text Theme
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: Color(0xff161F1B),
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400,
      fontSize: 32,
    ),
    titleMedium: TextStyle(
      color: Color(0xff161F1B),
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      overflow: TextOverflow.ellipsis,

      color: Color(0xff3A4640),
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    labelSmall: TextStyle(
      color: Colors.black,
      fontFamily: 'poppins',
      fontSize: 18,
      fontWeight: FontWeight.normal,
    ),
    displayLarge: TextStyle(
      color: Color(0xff161F1B),
      fontFamily: "plus",
      fontSize: 28,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      color: Color(0xff161F1B),
      fontFamily: "plus",
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      color: Color(0xff161F1B),
      fontFamily: "plus",
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  ),
  //inputDecoration Theme
  inputDecorationTheme: InputDecorationTheme(
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 0.7),
      borderRadius: BorderRadius.circular(16),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffD1DAD6), width: 0.7),
      borderRadius: BorderRadius.circular(16),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffD1DAD6), width: 0.7),
      borderRadius: BorderRadius.circular(16),
    ),
    fillColor: Colors.white,
    filled: true,
    hintStyle: TextStyle(
      fontFamily: 'poppins',
      color: Color(0xff6D6D6D),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),

      borderSide: BorderSide(color: Color(0xffD1DAD6), width: 0.7),
    ),
  ),

  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.black,
    selectionColor: const Color.fromARGB(255, 117, 240, 181),
    selectionHandleColor: const Color.fromARGB(255, 117, 240, 181),
  ), //elevatedButton Theme
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
    iconTheme: IconThemeData(color: Color(0xff161F1B)),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400,
      color: Color(0xff161F1B),
    ),
    surfaceTintColor: AppColor.primaryText,
    backgroundColor: Color(0xffF6F7F9),
    //Color(0xffF6F7F9)
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
  iconTheme: IconThemeData(color: Color(0xff161F1B)),

  dividerTheme: DividerThemeData(color: Color(0xffD1DAD6)),
);
