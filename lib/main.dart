import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_image_editor/ImageEditorLocalise.dart';

import 'app.dart';

void main() {

  ImageEditorLocalise();

  runApp(
    const ProviderScope(
      child: MyApp()
    )
  );
}




