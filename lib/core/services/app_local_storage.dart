import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static String usernameKey = "username";
  static String kOnboardingKey = "onboarding";
  //save and get name
  static Future<void> saveName(String name) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(usernameKey, name);
  }

  static Future<String?> getName() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(usernameKey);
  }

  //save and get onboarding
  static Future<void> saveOnboarding(
    bool onboarding,
  ) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(kOnboardingKey, onboarding);
  }

  static Future<bool?> getKOnboarding() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(kOnboardingKey);
  }
}
