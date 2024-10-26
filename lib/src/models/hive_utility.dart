import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveUtility {
  static Future<void> saveBooleanValue(String boxName, String key, bool value) async {
    var box = await Hive.openBox(boxName);
    await box.put(key, value);
  }

  static Future<bool> getBooleanValue(String boxName, String key, {bool defaultValue = false}) async {
    var box = await Hive.openBox(boxName);
    return box.get(key, defaultValue: defaultValue);
  }

  /// Initialize the Hive package
  static Future<void> initializeHive() async {
    final appDocumentsDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentsDirectory.path);
  }
}