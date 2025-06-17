import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static String usernameKey = "username";
  static String kOnboardingKey = "onboarding";
  static late SharedPreferences _prefs;

  //save and get name

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveName(String name) async {
    await _prefs.setString(usernameKey, name);
  }

  static String? getName() {
    return _prefs.getString(usernameKey);
  }

  //save and get onboarding
  static Future<void> saveOnboarding(bool onboarding) async {
    await _prefs.setBool(kOnboardingKey, onboarding);
  }

  static bool? getKOnboarding() {
    return _prefs.getBool(kOnboardingKey);
  }
}
