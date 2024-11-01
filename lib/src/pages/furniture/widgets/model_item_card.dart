import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_flutter_plugin/widgets/ar_view.dart';
import 'package:flutter/material.dart';
import 'package:furnish_ar/src/models/model_item.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

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
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 2.0, bottom: 8.0),
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
                onPressed: () async {
                  var status = await Permission.camera.status;

                  // If permission is denied permanently, navigate the user to app settings.
                  if (status.isPermanentlyDenied) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Camera permission is permanently denied. Please enable it in Settings.'),
                        action: SnackBarAction(
                          label: 'Settings',
                          onPressed: () {
                            openAppSettings(); // Opens device settings for the app
                          },
                        ),
                      ),
                    );
                    return;
                  }

                  // Request permission if it’s not granted
                  if (await Permission.camera.request().isGranted) {
                    if (context.mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ARViewPage(modelPath: item.modelPath),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Camera permission is required to try this feature.')),
                    );
                  }
                },
                child: const Text('TRY'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
class ARViewPage extends StatefulWidget {
  final String modelPath;

  const ARViewPage({Key? key, required this.modelPath}) : super(key: key);

  @override
  _ARViewPageState createState() => _ARViewPageState();
}

class _ARViewPageState extends State<ARViewPage> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  ARNode? arNode;

  @override
  void dispose() {
    arSessionManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Place Furniture in Your Space')),
      body: Container(
        color: Colors.black,
        child: ARView(
          onARViewCreated: onARViewCreated,
          planeDetectionConfig: PlaneDetectionConfig.horizontal,
        ),
      ),
    );
  }

  void onARViewCreated(
      ARSessionManager sessionManager,
      ARObjectManager objectManager,
      ARAnchorManager anchorManager,
      ARLocationManager locationManager,
      ) {
    arSessionManager = sessionManager;
    arObjectManager = objectManager;

    arSessionManager.onInitialize(
      showFeaturePoints: true,
      showPlanes: true,
      handleTaps: true,
    );

    arObjectManager.onInitialize();
    arSessionManager.onPlaneOrPointTap = onPlaneTap;

    print("AR Session successfully initialized.");
  }

  // Handle taps on detected planes
  void onPlaneTap(List<ARHitTestResult> hitTestResults) {
    if (hitTestResults.isNotEmpty) {
      final hitResult = hitTestResults.first;
      addOrMoveFurnitureModel(hitResult.worldTransform);
    }
  }

  Future<void> addOrMoveFurnitureModel(vector.Matrix4 transform) async {
    // Remove existing model if any
    if (arNode != null) {
      await arObjectManager.removeNode(arNode!);
    }

    // Create and add new ARNode with .glb model support
    final newNode = ARNode(
      type: NodeType.localGLTF2, // .glb is a binary version of GLTF2
      uri: widget.modelPath, // Ensure this is the correct path to .glb file
      scale: vector.Vector3(0.5, 0.5, 0.5),
      position: vector.Vector3(
        transform.getTranslation().x,
        transform.getTranslation().y,
        transform.getTranslation().z,
      ),
      rotation: vector.Vector4(0.0, 0.0, 0.0, 1.0),
    );

    bool? didAddNode = await arObjectManager.addNode(newNode);
    if (didAddNode == true) {
      arNode = newNode;
      print("Furniture model (.glb) added to AR view.");
    } else {
      print("Failed to add furniture model (.glb).");
    }
  }
}