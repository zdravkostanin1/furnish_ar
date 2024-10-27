import 'package:flutter/material.dart';
import 'package:furnish_ar/src/models/catalog_item.dart';
import 'package:furnish_ar/src/models/model_item.dart';
import 'package:furnish_ar/src/pages/catalog/widgets/space_item_card.dart';
import 'package:furnish_ar/src/pages/furniture/view/furniture.dart';
import 'package:furnish_ar/src/utils/constants.dart';
import 'package:page_transition/page_transition.dart';

class SpacePage extends StatefulWidget {
  const SpacePage({super.key});

  @override
  State<StatefulWidget> createState() => _SpacePageState();
}

class _SpacePageState extends State<SpacePage> {
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

  List<ModelItem> _getSpecificFurniture(List<CatalogItem> filteredItems) {
    final selectedRoomType = filteredItems[selectedIndex!].name;
    List<ModelItem> selectedItems;

    switch (selectedRoomType) {
      case 'Living room':
        selectedItems = livingRoomItems;
        break;
      case 'Bedroom':
        selectedItems = bedroomItems;
        break;
      case 'Dining room':
        selectedItems = diningRoomItems;
        break;
      case 'Office':
        selectedItems = officeItems;
        break;
      case 'Outdoor':
        selectedItems = outdoorItems;
        break;
      case 'Kitchen':
        selectedItems = kitchenItems;
        break;
      case 'Bathroom':
        selectedItems = bathroomItems;
        break;
      case 'Entryway':
        selectedItems = entrywayItems;
        break;
      case 'Kid\'s room':
        selectedItems = kidsRoomItems;
        break;
      case 'Storage room':
        selectedItems = storageRoomItems;
        break;
      default:
        selectedItems = [];
    }
    return selectedItems;
  }

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
          'CHOOSE YOUR SPACE',
          style: TextStyle(
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
                // IconButton(
                //   icon: const Icon(Icons.filter_list),
                //   onPressed: () {
                //     showModalBottomSheet(
                //       context: context,
                //       builder: (context) {
                //         return Container(
                //           padding: const EdgeInsets.all(16.0),
                //           height: 200,
                //           child: const Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 'Filters',
                //                 style: TextStyle(
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //               // Add filter options here
                //               // For example, checkboxes, sliders, etc.
                //             ],
                //           ),
                //         );
                //       },
                //     );
                //   },
                // ),
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
                    if (selectedIndex == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('To proceed, you must select a space to furnish. 🛋️'),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: FurniturePage(
                            roomType: filteredItems[selectedIndex!].name,
                            items: _getSpecificFurniture(filteredItems),
                          ),
                          duration: const Duration(milliseconds: 300),
                        ),
                      );
                    }
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
