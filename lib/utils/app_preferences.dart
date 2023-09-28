import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static final String _keyAdminId = 'admin_id';
  static final String _keyCustomerId = 'customer_id';
  static final String _keySampleId = 'sample_id';  
  static final String _keyAuthToken = 'auth_token';  

  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static int? getAdminId() {
    return _prefs!.getInt(_keyAdminId);
  }

  static int? getCustomerId() {
    return _prefs!.getInt(_keyCustomerId);
  }

  static int? getSampleId() {
    return _prefs!.getInt(_keySampleId) ;
  }

  static String? getAuthToken() {
    return _prefs!.getString(_keyAuthToken);
  }

  static Future<void> setAuthToken(String token) async {
    await _prefs!.setString(_keyAuthToken, token);
  }

  static Future<void> setAdminId(int userId) async {
    await _prefs!.setInt(_keyAdminId, userId);
  }

  static Future<void> setCustomerId(int userId) async {
    await _prefs!.setInt(_keyCustomerId, userId);
  }

  static Future<void> setSampleId(int userId) async {
    await _prefs!.setInt(_keySampleId, userId);
  }

  static Future<void> clear() async {
    await _prefs!.clear();
  }


}
