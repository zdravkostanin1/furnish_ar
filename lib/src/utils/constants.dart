import 'package:flutter/material.dart';
import 'package:furnish_ar/src/models/model_item.dart';
import 'package:introduction_screen/introduction_screen.dart';

/// The different AR items that are available in the app to be used.
final List<ModelItem> livingRoomItems = [
  /// SOFAS
  ModelItem(
    modelPath: 'assets/models/living_room/sofas/sofa.glb',
    name: 'Grey sofa',
    description: 'A comfortable and stylish grey sofa for your living room.',
  ),
  ModelItem(
    modelPath: 'assets/models/living_room/sofas/sofa_48.glb',
    name: 'Light-grey sofa',
    description:
        'A comfortable and stylish light-grey sofa for your living room.',
  ),
  ModelItem(
    modelPath: 'assets/models/living_room/sofas/sofa_49.glb',
    name: 'Black sofa',
    description:
        'A comfortable and stylish complete-black sofa for your living room.',
  ),
  ModelItem(
    modelPath: 'assets/models/living_room/sofas/sofa_single.glb',
    name: 'Chair-sofa',
    description: 'A different type of sofa for your living room.',
  ),
  ModelItem(
    modelPath: 'assets/models/living_room/sofas/modern__sofa.glb',
    name: 'White sofa',
    description: 'A comfortable and vibrant sofa for your living room.',
  ),
  ModelItem(
    modelPath: 'assets/models/living_room/sofas/sofa_-_ikea_nockeby.glb',
    name: 'Blue sofa',
    description: 'A comfortable and vibrant sofa for your living room.',
  ),

  /// COFFEE TABLES
  ModelItem(
    modelPath: 'assets/models/living_room/coffee_tables/coffee_table.glb',
    name: 'Black coffee table',
    description: 'A solid black coffee table for your living room.',
  ),
  ModelItem(
    modelPath: 'assets/models/living_room/coffee_tables/coffee_table_2.glb',
    name: 'Vibrant greenish coffee table',
    description: 'A vibrant greenish coffee table for your living room.',
  ),
  ModelItem(
    modelPath: 'assets/models/living_room/coffee_tables/cass_coffee_table.glb',
    name: 'White coffee table',
    description: 'A white coffee table for your living room.',
  ),
  ModelItem(
    modelPath: 'assets/models/living_room/coffee_tables/coffee_table_1.glb',
    name: 'Brown coffee table',
    description: 'A brown coffee table for your living room.',
  ),
  ModelItem(
    modelPath: 'assets/models/living_room/coffee_tables/coffee_table_marina.glb',
    name: 'White coffee table',
    description: 'A vibrant white coffee table for your living room.',
  ),
  ModelItem(
    modelPath: 'assets/models/living_room/coffee_tables/noguchi_coffee_table.glb',
    name: 'Transparent coffee table',
    description: 'A vibrant transparent - beautiful coffee table for your living room.',
  ),
  ModelItem(
    modelPath: 'assets/models/living_room/coffee_tables/retro_wood_coffee_table.glb',
    name: 'Wooden coffee table',
    description: 'A wooden old-money type of coffee table for your living room.',
  ),
  ModelItem(
    modelPath: 'assets/models/living_room/coffee_tables/vintage_coffee_table_70s_02_freebie.glb',
    name: 'Vintage coffee table',
    description: 'An elegant vintage coffee table for your living room.',
  ),
  ModelItem(
    modelPath: 'assets/models/living_room/coffee_tables/white_coffee_table.glb',
    name: 'White coffee table',
    description: 'A white and stylish coffee table for your living room.',
  ),
  ModelItem(
    modelPath: 'assets/models/living_room/coffee_tables/coffee_tables_four_legs_with_rattan_i_low-poly.glb',
    name: 'Wooden coffee table',
    description: 'A wooden coffee table for your living room.',
  ),
  ModelItem(
    modelPath: 'assets/models/living_room/coffee_tables/hooper_storage_coffee_table_natural_ash.glb',
    name: 'Storage coffee table',
    description: 'A storage coffee table with loads of space for your living room.',
  ),
];
final List<ModelItem> bedroomItems = [
  ModelItem(
    modelPath: 'assets/models/bedroom/bed_01.glb',
    name: 'Wooden & white bedroom set',
    description: 'A wooden and white bedroom set for your bedroom.',
  ),
  ModelItem(
    modelPath: 'assets/models/bedroom/bed_06.glb',
    name: 'Blue bedroom set',
    description: 'A stylish blue bedroom set for your bedroom.',
  ),
  ModelItem(
    modelPath: 'assets/models/bedroom/bed_07.glb',
    name: 'Elegant bedroom set',
    description: 'An elegant bedroom set for your bedroom.',
  ),
  ModelItem(
    modelPath: 'assets/models/bedroom/unseen_fancy_bed.glb',
    name: 'Bedroom set with frames',
    description: 'A bedroom set with frames for your bedroom.',
  ),
];
final List<ModelItem> diningRoomItems = [
  ModelItem(
    modelPath: 'assets/models/dining_room/tables/modern_dining_table.glb',
    name: 'Modern dining table',
    description: 'A dining table with a modern design for your dining room.',
  ),
  ModelItem(
    modelPath: 'assets/models/dining_room/tables/simple_dining_table.glb',
    name: 'Simple dining table',
    description: 'A simple dining table for your dining room.',
  ),
  ModelItem(
    modelPath: 'assets/models/dining_room/chairs/chair.glb',
    name: 'Simple dining chair',
    description: 'A simple dining chair for your dining room.',
  ),
  ModelItem(
    modelPath: 'assets/models/dining_room/chairs/dining_chair.glb',
    name: 'Grey dining chair',
    description: 'A simple and stylish grey chair for your dining room.',
  ),
  ModelItem(
    modelPath: 'assets/models/dining_room/chairs/merax_dining_chair_leisure_padded_chair.glb',
    name: 'White dining chair',
    description: 'A simple white chair for your dining room.',
  ),
  ModelItem(
    modelPath: 'assets/models/dining_room/chairs/modern_dining_chair.glb',
    name: 'Premium white chair',
    description: 'A premium white chair for your dining room.',
  ),
];
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
    body:
        "Furnish AR is a furniture app that allows you to visualize furniture in your home using augmented reality",
    image: const Center(
      child: Image(
        image: AssetImage('assets/images/ar.png'),
        height: 175.0,
      ),
    ),
  ),
  PageViewModel(
    title: "CHOOSE FURNITURE THAT FITS YOU",
    body:
        "Use our rich catalog of furniture items to find the perfect fit for your home",
    image: const Center(
      child: Image(
        image: AssetImage('assets/images/armchair.png'),
        height: 175.0,
      ),
    ),
  ),
  PageViewModel(
    title: "3D VISUALIZATION OF FURNITURE",
    body:
        "Beautiful and realistic 3D models of furniture items to help you visualize them in your home",
    image: const Center(
      child: Image(
        image: AssetImage('assets/images/pillow.png'),
        height: 175.0,
      ),
    ),
  ),
];
