import 'package:flutter/material.dart';
import 'package:furnish_ar/src/models/model_item.dart';
import 'package:furnish_ar/src/pages/furniture/widgets/model_item_card.dart';

class FurniturePage extends StatefulWidget {
  final String roomType;
  final List<ModelItem> items;

  const FurniturePage({super.key, required this.roomType, required this.items});

  @override
  State<StatefulWidget> createState() => _FurniturePageState();
}

class _FurniturePageState extends State<FurniturePage> {
  String searchQuery = '';
  String? selectedFilter;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1)); /// Simulated loading delay
    setState(() {
      isLoading = false;
    });
  }

  void _applyFilter(String? filter) async {
    setState(() {
      selectedFilter = filter;
      isLoading = true; /// Start loading when filter is applied
    });
    await Future.delayed(const Duration(seconds: 1)); /// Simulated loading delay
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Implement for all types of spaces (filters).
    /// Filter items based on search query and selected filter
    List<ModelItem> filteredItems = widget.items.where((item) {
      final matchesSearchQuery = item.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          item.description.toLowerCase().contains(searchQuery.toLowerCase());

      final matchesFilter = selectedFilter == null ||
          (selectedFilter == 'chairs' && item.name.contains('chair')) ||
          (selectedFilter == 'tables' && item.name.contains('table'));
      return matchesSearchQuery && matchesFilter;
    }).toList();

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
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Filters',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  FilterChip(
                                    label: const Text("Chairs"),
                                    selectedColor: Colors.blue[200],
                                    selected: selectedFilter == "chairs",
                                    onSelected: (selected) {
                                      setState(() {
                                        selectedFilter = selected ? "chairs" : null;
                                      });
                                      _applyFilter(selected ? "chairs" : null);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  FilterChip(
                                    label: const Text("Tables"),
                                    selected: selectedFilter == "tables",
                                    selectedColor: Colors.blue[100],
                                    onSelected: (selected) {
                                      setState(() {
                                        selectedFilter = selected ? "tables" : null;
                                      });
                                      _applyFilter(selected ? "tables" : null);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
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
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
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