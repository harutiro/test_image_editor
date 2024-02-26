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
          child: const Text("一枚の画像を編集する"),
          onPressed: () async {

            await ref.read(editPageControllerProvider.notifier).readImage().then((value) async {

              if(value == null){
                return;
              }

              var editedImage = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageEditor(
                    image: value,
                  ),
                ),
              );

              // replace with edited image
              if (editedImage != null) {
                imageData = editedImage;
                if(imageData != null){
                  ref.read(editPageControllerProvider.notifier).writeImage(imageData!);
                }
              }
            });
          },
        ),
        ElevatedButton(
          child: const Text("複数の画像を編集する"),
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
              if(imageData != null){
                ref.read(editPageControllerProvider.notifier).writeImage(imageData!);
              }
            }
          },
        ),
      ],
    );
  }
}