import 'package:flutter/material.dart';
import 'package:todo_app/core/services/app_local_storage.dart';

class ThemeController {
  static ValueNotifier<ThemeMode> valueNotifier = ValueNotifier(ThemeMode.dark);

  init() {
    bool isDark = AppLocalStorage.getBool(AppLocalStorage.theme) ?? true;
    if (isDark) {
      valueNotifier.value = ThemeMode.dark;
    } else {
      valueNotifier.value = ThemeMode.light;
    }
  }

  static toggleTheme() async {
    if (valueNotifier.value == ThemeMode.dark) {
      valueNotifier.value = ThemeMode.light;
      await AppLocalStorage.setBool(AppLocalStorage.theme, false);
    } else {
      valueNotifier.value = ThemeMode.dark;
      await AppLocalStorage.setBool(AppLocalStorage.theme, true);
    }
  }
}
