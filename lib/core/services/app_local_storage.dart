import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static String usernameKey = "username";
  static String kOnboardingKey = "onboarding";
  static String motivationQuote = "motivationQuote";
  static String theme = "theme";
  static late SharedPreferences _prefs;

  //save and get name

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveName(String name) async {
    await _prefs.setString(usernameKey, name);
  }

  static setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  static getBool(String key) {
    return _prefs.getBool(key);
  }

  static getString(String key) {
    return _prefs.getString(key);
  }

  static Future<void> clearUserData() async {
    await _prefs.remove(motivationQuote);
    await _prefs.remove(usernameKey);
    await _prefs.remove(kOnboardingKey);
    await _prefs.remove('tasks');
  }

  static String? getName() {
    return _prefs.getString(usernameKey);
  }

  static Future<void> savemotivationQuote(String quote) async {
    await _prefs.setString(motivationQuote, quote);
  }

  static String? getmotivationQuote() {
    return _prefs.getString(motivationQuote);
  }

  //save and get onboarding
  static Future<void> saveOnboarding(bool onboarding) async {
    await _prefs.setBool(kOnboardingKey, onboarding);
  }

  static bool? getKOnboarding() {
    return _prefs.getBool(kOnboardingKey);
  }
}
