import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static String usernameKey = "username";
  static String kOnboardingKey = "onboarding";

  static Future<void> saveName(String name) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(usernameKey, name);
  }

  static Future<void> saveOnboarding(
    bool onboarding,
  ) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(kOnboardingKey, onboarding);
  }

  static Future<String?> getName() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(usernameKey);
  }

  static Future<bool?> getKOnboarding() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(AppLocalStorage.kOnboardingKey);
  }
}
