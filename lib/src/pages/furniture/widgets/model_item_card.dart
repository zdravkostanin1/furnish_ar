import 'package:flutter/material.dart';
import 'package:furnish_ar/src/models/model_item.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelItemCard extends StatelessWidget {
  final ModelItem item;
  final bool isSelected;

  const ModelItemCard({super.key, required this.item, this.isSelected = false});

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
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8.0)),
              child: ModelViewer(
                src: item.modelPath,
                // Reference to the asset path
                alt: "A 3D model of ${item.name}",
                autoRotate: true,
                cameraControls: true,
                backgroundColor: Colors.white,
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0, bottom: 8.0),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text('TRY'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
