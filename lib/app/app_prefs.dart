import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _sharedPref;
  static const _token = 'usertoken';
  static const _expireDate = 'expireDate';
  static const _role = 'role';

  static Future init() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

//!------------------------------- Token---------------------------- */
  static Future setTokenValue(String value) async {
                                 //key + val
    await _sharedPref!.setString(_token, value);
  }

  static String getTokenValue() {
    return _sharedPref!.getString(_token) ?? '';
  }

  static Future clearToken() async {
    await _sharedPref!.remove(_token);
  }

//!-------------------------------  Expire Date  ---------------------------- */
  static Future setExpireDateValue(String value) async {
    await _sharedPref!.setString(_expireDate, value);
  }

  static String getExpireDateValue() {
    return _sharedPref!.getString(_expireDate) ?? '';
  }

  static Future clearExpireDateValue() async {
    await _sharedPref!.remove(_expireDate);
  }

//!-------------------------------  Role  ---------------------------- */
  static Future setRoleValue(String value) async {
    await _sharedPref!.setString(_role, value);
  }

  static String getRoleValue() {
    return _sharedPref!.getString(_role) ?? '';
  }

  static Future clearRoleValue() async {
    await _sharedPref!.remove(_role);
  }
  
}
