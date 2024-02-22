import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_page_controller.g.dart';

@riverpod
class EditPageController extends _$EditPageController {

  final String name = "sample.png";
  Uint8List? imageData;

  @override
  Future<Uint8List?> build() async {
    var data = await rootBundle.load('assets/$name');
    imageData = data.buffer.asUint8List();

    return imageData;
  }
}