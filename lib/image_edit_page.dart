import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImageEditPage extends HookConsumerWidget {
  const ImageEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        Text('Image Edit Page'),
        SizedBox(height: 20),
      ],
    );
  }
}