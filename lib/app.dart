import 'package:flutter/material.dart';
import 'package:furnish_ar/src/pages/welcome/view/welcome.dart';
import 'package:introduction_screen/introduction_screen.dart';

class App extends StatelessWidget {
  App({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: "AUGMENTED REALITY",
      body: "Furnish AR is a furniture app that allows you to visualize furniture in your home using augmented reality",
      image: const Center(
        child: Image(
          image: AssetImage('assets/images/ar.png'),
          height: 175.0,
        ),
      ),
    ),
    PageViewModel(
      title: "CHOOSE FURNITURE THAT FITS YOU",
      body: "Use our rich catalog of furniture items to find the perfect fit for your home",
      image: const Center(
        child: Image(
          image: AssetImage('assets/images/armchair.png'),
          height: 175.0,
        ),
      ),
    ),
    PageViewModel(
      title: "3D VISUALIZATION OF FURNITURE",
      body: "Beautiful and realistic 3D models of furniture items to help you visualize them in your home",
      image: const Center(
        child: Image(
          image: AssetImage('assets/images/pillow.png'),
          height: 175.0,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FURNISH AR',
      home: IntroductionScreen(
        pages: pages,
        skip: const Text("SKIP", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        showSkipButton: true,
        next: const Text("NEXT",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        showNextButton: true,
        done: const Text("DONE",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        // TODO: Implement
        onDone: () { },
        skipStyle: TextButton.styleFrom(foregroundColor: Colors.black),
        doneStyle: TextButton.styleFrom(foregroundColor: Colors.black),
        nextStyle: TextButton.styleFrom(foregroundColor: Colors.black),
      ),
      // WelcomePage(),
    );
  }
}