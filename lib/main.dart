import 'package:flutter/material.dart';
import 'package:furnish_ar/app.dart';
import 'package:furnish_ar/src/models/hive_utility.dart';
import 'package:furnish_ar/src/pages/introduction/view/introduction.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveUtility.initializeHive();

  final bool hasPassedIntro = await HiveUtility.getBooleanValue('intro', 'introPassed');

  runApp(
    hasPassedIntro ? const App() : const MaterialApp(home: IntroductionPage(), debugShowCheckedModeBanner: false),
  );
}
