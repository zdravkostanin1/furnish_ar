import 'package:flutter/material.dart';
import 'package:furnish_ar/src/models/catalog_item.dart';
import 'package:furnish_ar/src/pages/catalog/widgets/catalog_item_card.dart';

class CatalogApp extends StatelessWidget {
  const CatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FURNITURE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CatalogPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<StatefulWidget> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  List<CatalogItem> items = [
    CatalogItem(
      imagePath: 'assets/images/living_room.jpg',
      // imageUrl: 'assets/models/sofa/sofa.glb',
      name: 'Living room',
      description: 'Comfort and style for your living room.',
    ),
    CatalogItem(
      imagePath: 'assets/images/bedroom.jpg',
      name: 'Bedroom',
      description: 'Everything you need for a cozy bedroom.',
    ),
    CatalogItem(
      imagePath: 'assets/images/dining_room.jpg',
      name: 'Dining room',
      description: 'Perfect pieces for your dining area.',
    ),
    CatalogItem(
      imagePath: 'assets/images/office_room.jpg',
      name: 'Office',
      description: 'Essential items for your workspace.',
    ),
    CatalogItem(
      imagePath: 'assets/images/outdoor.jpg',
      name: 'Outdoor',
      description: 'Stylish and durable furniture for outside.',
    ),
    CatalogItem(
      imagePath: 'assets/images/kitchen.jpg',
      name: 'Kitchen',
      description: 'Functional and trendy pieces for your kitchen.',
    ),
    // Add more items as needed
    CatalogItem(
      imagePath: 'assets/images/bathroom.jpg',
      name: 'Bathroom',
      description: 'Everything for your bathroom.',
    ),
    CatalogItem(
      imagePath: 'assets/images/entryway_room.jpg',
      name: 'Entryway',
      description: 'Welcome essentials for your home’s entrance.',
    ),
    CatalogItem(
      imagePath: 'assets/images/kids_room.jpg',
      name: 'Kid\'s room',
      description: 'Fun and safe pieces for children’s rooms.',
    ),
    CatalogItem(
      imagePath: 'assets/images/storage_room.jpg',
      name: 'Storage room',
      description: 'Smart solutions to organize your space.',
    ),
  ];

  String searchQuery = '';
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    // Filter items based on search query
    List<CatalogItem> filteredItems = items
        .where((item) =>
            item.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
            item.description.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FURNITURE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar and Filter Button
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    // Implement filter functionality here
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          height: 200,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Filters',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Add filter options here
                              // For example, checkboxes, sliders, etc.
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: filteredItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: CatalogItemCard(
                      item: filteredItems[index],
                      isSelected: selectedIndex == index,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   PageTransition(
                    //     type: PageTransitionType.leftToRight,
                    //     child: const CatalogPage(),
                    //     duration: const Duration(milliseconds: 300),
                    //   ),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff091057),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'PROCEED WITH SELECTION',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
