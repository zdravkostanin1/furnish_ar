import 'package:flutter/material.dart';
import 'package:furnish_ar/src/pages/welcome/view/welcome.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FURNISH AR',
      home: WelcomePage(),
      // WelcomePage(),
    );
  }
}
