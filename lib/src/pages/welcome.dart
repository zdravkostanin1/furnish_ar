import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'catalog.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('FURNISH AR', style: GoogleFonts.lacquer(fontSize: 30.0, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.only(left: 45.0, right: 45.0, bottom: 10.0),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  textStyle: const TextStyle(
                    fontSize: 20.0,
                    // fontWeight: FontWeight.bold,
                  ),
                  'Welcome! 🎉',
                  speed: const Duration(milliseconds: 80),
                ),
                TypewriterAnimatedText(
                  'Let\'s start by choosing from our catalog of furniture.',
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CatalogPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: const Text(
                  'GO TO CATALOG',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
