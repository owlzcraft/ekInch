import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class ImageSourceSheet extends StatelessWidget {
  // Constructor
  ImageSourceSheet({Key? key, required this.onImageSelected}) : super(key: key);

  // Callback function to return image file
  final Function(File?) onImageSelected;
  // ImagePicker instance
  final picker = ImagePicker();

  Future<void> selectedImage(BuildContext context, File? image) async {

    if (image != null) {
    
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                /// Select image from gallery
                TextButton.icon(
                  icon: const Icon(Icons.photo_library,
                      color: Colors.grey, size: 27),
                  label: const Text("gallery", style: TextStyle(fontSize: 16)),
                  onPressed: () async {
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (image == null) return;

                    selectedImage(context, File(image.path));
                  },
                ),

                /// Capture image from camera
                TextButton.icon(
                  icon: Icon(Icons.camera_alt),
                  label: const Text("camera", style: TextStyle(fontSize: 16)),
                  onPressed: () async {
                    // Capture image from camera
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.camera);

                    if (image == null) return;
                    selectedImage(context, File(image.path));
                  },
                ),
              ],
            ));
  }
}
