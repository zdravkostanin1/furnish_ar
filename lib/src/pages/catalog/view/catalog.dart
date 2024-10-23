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
      imageUrl: 'https://via.placeholder.com/150',
      name: 'Item 1',
      description: 'Description for Item 1',
    ),
    CatalogItem(
      imageUrl: 'https://via.placeholder.com/150',
      name: 'Item 2',
      description: 'Description for Item 2',
    ),
    CatalogItem(
      imageUrl: 'https://via.placeholder.com/150',
      name: 'Item 3',
      description: 'Description for Item 3',
    ),
    CatalogItem(
      imageUrl: 'https://via.placeholder.com/150',
      name: 'Item 4',
      description: 'Description for Item 4',
    ),
    // Add more items as needed
  ];

  String searchQuery = '';

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
            // Catalog Grid
            Expanded(
              child: GridView.builder(
                itemCount: filteredItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4, // Adjust as needed
                ),
                itemBuilder: (context, index) {
                  return CatalogItemCard(item: filteredItems[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}