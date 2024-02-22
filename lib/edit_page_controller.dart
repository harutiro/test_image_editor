import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_page_controller.g.dart';

@riverpod
class EditPageController extends _$EditPageController {

  @override
  Future<Uint8List?> build() async {
    return null;
  }

  // 画像をギャラリーから選ぶ関数
  Future<Uint8List?> readImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      // 画像がnullの場合戻る
      if (image == null) return null;

      // 画像をUint8Listに変換
      return await image.readAsBytes();

    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
      return null;
    }
  }

  Future<bool> writeImage( Uint8List imageData) async {
    // アルバムに保存
    return await ImageGallerySaver.saveImage(imageData);

  }

}