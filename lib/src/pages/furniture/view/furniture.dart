import 'package:flutter/material.dart';
import 'package:furnish_ar/src/models/model_item.dart';
import 'package:furnish_ar/src/pages/furniture/widgets/model_item_card.dart';

class FurniturePage extends StatefulWidget {
  final String roomType;

  const FurniturePage({super.key, required this.roomType});

  @override
  State<StatefulWidget> createState() => _FurniturePageState();
}

class _FurniturePageState extends State<FurniturePage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // TODO: Load furniture items here based on the chosen space of home.
    List<ModelItem> sofas = [
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

    // Filter items based on search query
    List<ModelItem> filteredItems = sofas
        .where((item) =>
            item.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
            item.description.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.roomType.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
                    // Add filter functionality if needed
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
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  return ModelItemCard(
                    item: filteredItems[index],
                    isSelected: false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
