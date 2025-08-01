import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/core/util/color.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColor.background,
  colorScheme: ColorScheme.dark(
    primaryContainer: AppColor.surface,
    secondary: Color(0xff282828),
    primaryFixed: Color(0xffFFFCFC),
  ),
  disabledColor: Color(0xffA0A0A0),
  hintColor: Color(0xffFFFCFC),
  cardColor: Color(0xffA0A0A0),
  primaryColorDark: Color(0xffC6C6C6),
  primaryColor: Color(0xff282828),
  listTileTheme: ListTileThemeData(),
  //check box theme
  checkboxTheme: CheckboxThemeData(
    checkColor: WidgetStateProperty.all(Colors.white),
    side: BorderSide(
      color: Color(0xff6E6E6E),
      width: 2, // border width
    ),
  ),
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
      overflow: TextOverflow.ellipsis,
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
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400,
      color: AppColor.primaryText,
    ),
    surfaceTintColor: AppColor.primaryText,
    backgroundColor: AppColor.background,
    systemOverlayStyle: SystemUiOverlayStyle.light,
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

  shadowColor: Color(0xff6E6E6E),
  iconTheme: IconThemeData(color: AppColor.primaryText),
  dividerTheme: DividerThemeData(color: Color(0xff6E6E6E)),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.white,
    selectionColor: const Color.fromARGB(255, 3, 156, 82),
    selectionHandleColor: const Color.fromARGB(255, 3, 156, 82),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 0,
    backgroundColor: AppColor.background,
    unselectedItemColor: AppColor.primaryText,
    selectedItemColor: AppColor.green,
    selectedLabelStyle: TextStyle(fontFamily: 'poppins', fontSize: 12),
  ),
  splashFactory: NoSplash.splashFactory,
  popupMenuTheme: PopupMenuThemeData(
    color: AppColor.background,

    // shadowColor: Color(AppColor.green.toARGB32()),
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),

      side: BorderSide(color: AppColor.green, width: 1),
    ),
    labelTextStyle: WidgetStateProperty.all(
      TextStyle(
        color: AppColor.primaryText,
        fontFamily: 'poppins',
        fontSize: 14,
      ),
    ),
  ),
);
