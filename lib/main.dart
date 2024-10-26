import 'package:flutter/material.dart';
import 'package:furnish_ar/app.dart';
import 'package:furnish_ar/src/models/hive_utility.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveUtility.initializeHive();

  final bool hasPassedIntro = await HiveUtility.getBooleanValue('intro', 'introPassed');

  runApp(hasPassedIntro ? const App() : MaterialApp(home: introductionWidget()));
}