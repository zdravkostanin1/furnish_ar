import 'package:flutter/material.dart';
import 'package:furnish_ar/src/models/catalog_item.dart';
import 'package:furnish_ar/src/models/model_item.dart';
import 'package:introduction_screen/introduction_screen.dart';

/// The different AR items that are available in the app to be used.
final List<ModelItem> livingRoomItems = [
    ModelItem(
      modelPath: 'assets/models/sofas/sofa.glb',
      name: 'Grey sofa',
      description: 'A comfortable and stylish grey sofa for your living room.',
    ),
    ModelItem(
      modelPath: 'assets/models/sofas/sofa_48.glb',
      name: 'Light-grey sofa',
      description: 'A comfortable and stylish light-grey sofa for your living room.',
    ),
    ModelItem(
      modelPath: 'assets/models/sofas/sofa_49.glb',
      name: 'Black sofa',
      description: 'A comfortable and stylish complete-black sofa for your living room.',
    ),
    ModelItem(
      modelPath: 'assets/models/sofas/sofa_single.glb',
      name: 'Chair-sofa',
      description: 'A different type of sofa for your living room.',
    ),
    ModelItem(
      modelPath: 'assets/models/sofas/modern__sofa.glb',
      name: 'White sofa',
      description: 'A comfortable and vibrant sofa for your living room.',
    ),
    ModelItem(
      modelPath: 'assets/models/sofas/sofa_-_ikea_nockeby.glb',
      name: 'Blue sofa',
      description: 'A comfortable and vibrant sofa for your living room.',
    ),
];
final List<ModelItem> bedroomItems = [];
final List<ModelItem> diningRoomItems = [];
final List<ModelItem> officeItems = [];
final List<ModelItem> outdoorItems = [];
final List<ModelItem> kitchenItems = [];
final List<ModelItem> bathroomItems = [];
final List<ModelItem> entrywayItems = [];
final List<ModelItem> kidsRoomItems = [];
final List<ModelItem> storageRoomItems = [];

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