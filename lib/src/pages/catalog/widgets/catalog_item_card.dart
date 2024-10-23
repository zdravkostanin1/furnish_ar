import 'package:flutter/material.dart';
import 'package:furnish_ar/src/models/catalog_item.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class CatalogItemCard extends StatelessWidget {
  final CatalogItem item;
  final bool isSelected;

  const CatalogItemCard({super.key, required this.item, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: isSelected
            ? Border.all(color: Colors.red, width: 3.0)
            : Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.asset(
                item.imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
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

// CODE FOR DISPLAYING 3D MODELS
// Expanded(
// child: ClipRRect(
// borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
// child: ModelViewer(
// src: item.imageUrl, // Reference to the asset path
// alt: "A 3D model of ${item.name}",
// autoRotate: true,
// cameraControls: true,
// backgroundColor: Colors.white,
// ),
// ),
// ),
