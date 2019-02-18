import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHolder {
 static const String LOGIN_STATUS_NAME = 'LOGIN_STATUS';

 Future<void> persistLoginStatus(bool status) async {
   final prefs = await SharedPreferences.getInstance();
   await prefs.setBool(LOGIN_STATUS_NAME, status);
 }

 Future<bool> isSignedIn() async {
   final prefs = await SharedPreferences.getInstance();
   return prefs.getBool(LOGIN_STATUS_NAME) ?? false;
 }
}