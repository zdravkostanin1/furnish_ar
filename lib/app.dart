import 'package:flutter/material.dart';
import 'package:furnish_ar/src/models/storage.dart';
import 'package:furnish_ar/src/pages/welcome/view/welcome.dart';
import 'package:furnish_ar/src/utils/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FURNISH AR',
      home: introductionWidget(),
      // WelcomePage(),
    );
  }
}

Widget introductionWidget() {
  return IntroductionScreen(
    pages: introPages,
    skip: const Text(
      "SKIP",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    showSkipButton: true,
    next: const Text(
      "NEXT",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    showNextButton: true,
    done: const Text(
      "DONE",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    // TODO: Implement
    onDone: () async {
      ///                            boxName,  key,                value
      await Storage.saveBooleanValue('intro', 'introPassed', true);

      // bool hasCompletedTutorial = await StorageService().getBooleanValue('tutorialCompleted');
    },
    skipStyle: TextButton.styleFrom(foregroundColor: Colors.black),
    doneStyle: TextButton.styleFrom(foregroundColor: Colors.black),
    nextStyle: TextButton.styleFrom(foregroundColor: Colors.black),
  );
}