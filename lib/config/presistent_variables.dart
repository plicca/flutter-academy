import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHolder {
  static const String LOGIN_STATUS_NAME = 'LOGIN_STATUS';
  static const String LANGUAGE_SETTING = "LANG_SET";
 
  Future<void> persistLoginStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(LOGIN_STATUS_NAME, status);
  }

  Future<String> persistLanguageSetting(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(LANGUAGE_SETTING, language);
  }
 
  Future<bool> isSignedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(LOGIN_STATUS_NAME) ?? false;
  }
 
  Future<String> languageSet() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(LANGUAGE_SETTING) ?? "pt";
  }
}