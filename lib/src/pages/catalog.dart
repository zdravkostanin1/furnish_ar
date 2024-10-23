import 'package:flutter/material.dart';

class CatalogApp extends StatelessWidget {
  const CatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Catalog Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CatalogPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CatalogItem {
  final String imageUrl;
  final String name;
  final String description;

  CatalogItem({
    required this.imageUrl,
    required this.name,
    required this.description,
  });
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
        title: const Text('FURNITURE', style: TextStyle(fontWeight: FontWeight.bold),),
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
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 0.0),
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
                          padding: EdgeInsets.all(16.0),
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Filter Options',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
            SizedBox(height: 20),
            // Catalog Grid
            Expanded(
              child: GridView.builder(
                itemCount: filteredItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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

class CatalogItemCard extends StatelessWidget {
  final CatalogItem item;

  const CatalogItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.network(
                item.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Name and Description
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
