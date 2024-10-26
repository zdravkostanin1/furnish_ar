import 'package:hive_flutter/hive_flutter.dart';

class Storage {
  static Future<void> saveBooleanValue(String boxName, String key, bool value) async {
    var box = await Hive.openBox(boxName);
    await box.put(key, value);
  }

  static Future<bool> getBooleanValue(String boxName, String key, {bool defaultValue = false}) async {
    var box = await Hive.openBox(boxName);
    return box.get(key, defaultValue: defaultValue);
  }
}