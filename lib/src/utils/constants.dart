import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

/// A list of [PageViewModel] objects that represent the introduction pages that are shown when the app is first launched.
final List<PageViewModel> introPages = [
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