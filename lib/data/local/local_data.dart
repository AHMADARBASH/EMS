import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static late SharedPreferences _prefrences;
  static Future init() async =>
      _prefrences = await SharedPreferences.getInstance();
  //storing data in local storage (token stored as string , data stored as json)
  static Future<void> saveData({key, data}) async {
    await _prefrences.setString(key, data);
  }

  //getting data from local storage
  static String? getData({key}) {
    return _prefrences.getString(key);
  }

  static Future<void> deleteKey(String key) async {
    await _prefrences.remove(key);
  }

  static bool containsKey(key) {
    return _prefrences.containsKey(key);
  }
}
