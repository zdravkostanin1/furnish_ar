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
    await Future.delayed(const Duration(seconds: 1)); // Simulated loading delay
    setState(() {
      isLoading = false;
    });
  }

  void _applyFilter(String? filter) async {
    setState(() {
      selectedFilter = filter;
      isLoading = true; // Start loading when filter is applied
    });
    await Future.delayed(const Duration(seconds: 1)); // Simulated loading delay
    setState(() {
      isLoading = false;
    });
  }

  // Function to get filters based on room type
  List<String> _getFiltersForRoom(String roomType) {
    switch (roomType.toLowerCase()) {
      case 'living room':
        return ['Sofa', 'Coffee table', 'Shelves'];
      case 'bedroom':
        return ['Bed', 'Nightstand', 'Dresser'];
      case 'dining room':
        return ['Dining table', 'Chair'];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> filters = _getFiltersForRoom(widget.roomType);

    // Filter items based on search query and selected filter
    List<ModelItem> filteredItems = widget.items.where((item) {
      final matchesSearchQuery = item.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          item.description.toLowerCase().contains(searchQuery.toLowerCase());

      final matchesFilter = selectedFilter == null ||
          (selectedFilter != null && item.name.toLowerCase().contains(selectedFilter!.toLowerCase()));

      return matchesSearchQuery && matchesFilter;
    }).toList();

    String noItemsMessage;
    if (searchQuery.isNotEmpty && filteredItems.isEmpty) {
      noItemsMessage = 'No items match your search.';
    } else if (selectedFilter != null && filteredItems.isEmpty) {
      noItemsMessage = 'No items match your filter.';
    } else {
      noItemsMessage = 'No items available.';
    }

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
                                children: filters.map((filter) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FilterChip(
                                      label: Text(filter),
                                      selected: selectedFilter == filter,
                                      selectedColor: Colors.blue[200],
                                      onSelected: (selected) {
                                        setState(() {
                                          selectedFilter = selected ? filter : null;
                                        });
                                        _applyFilter(selected ? filter : null);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                }).toList(),
                              ),
                              if (filters.isEmpty)
                                const Center(
                                  child: Text(
                                    'No filters available for this room.',
                                    style: TextStyle(color: Colors.grey),
                                  ),
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
                  : filteredItems.isEmpty
                  ? Center(
                child: Text(
                  noItemsMessage,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              )
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