import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:test_image_editor/edit_page_controller.dart';

class ImageEditPage extends HookConsumerWidget {
  const ImageEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Uint8List? imageData;
    ref.watch(editPageControllerProvider.notifier).build().then((value) => imageData = value);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (imageData != null) Image.memory(imageData!),
        const SizedBox(height: 16),
        ElevatedButton(
          child: const Text("Single image editor"),
          onPressed: () async {
            var editedImage = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageEditor(
                  image: imageData,
                ),
              ),
            );

            // replace with edited image
            if (editedImage != null) {
              imageData = editedImage;
              ref.read(editPageControllerProvider.notifier).imageData = imageData;
            }
          },
        ),
        ElevatedButton(
          child: const Text("Multiple image editor"),
          onPressed: () async {
            var editedImage = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageEditor(
                  images: [
                    imageData,
                    imageData,
                  ],
                ),
              ),
            );

            // replace with edited image
            if (editedImage != null) {
              imageData = editedImage;
              ref.read(editPageControllerProvider.notifier).imageData = imageData;
            }
          },
        ),
      ],
    );
  }
}