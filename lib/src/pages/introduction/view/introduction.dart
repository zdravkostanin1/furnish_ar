import 'package:flutter/material.dart';
import 'package:furnish_ar/src/models/hive_utility.dart';
import 'package:furnish_ar/src/utils/constants.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroductionScreen(
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
          await HiveUtility.saveBooleanValue('intro', 'introPassed', true);
        },
        skipStyle: TextButton.styleFrom(foregroundColor: Colors.black),
        doneStyle: TextButton.styleFrom(foregroundColor: Colors.black),
        nextStyle: TextButton.styleFrom(foregroundColor: Colors.black),
      ),
    );
  }
}