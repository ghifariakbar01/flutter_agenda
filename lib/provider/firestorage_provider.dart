import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/model/upload_model.dart';
import 'package:login/utils/snackbar.dart';
import 'package:path_provider/path_provider.dart';

class FileStorageProvider extends StateNotifier<UploadModel> {
  FileStorageProvider(super.state);

  void setDownloadUrl(String url) {
    state = state.copyWith(downloadUrl: url);
  }

  Future<void> onImgPick(XFile image) async {
    state = state.copyWith(imgPath: image.path);

    // show loading
    Get.dialog(
        Center(
            child: const CircularProgressIndicator(
          color: Colors.white,
        )),
        barrierDismissible: false);

    // compress image file
    final imgCompress = await FlutterImageCompress.compressWithFile(
      image.path,
      minWidth: 720,
      minHeight: 720,
      quality: 80,
    );

    if (imgCompress == null) {
      // dismiss loading
      Get.back();

      // show message failed to process image
      makeErrorSb('Failed', 'Failed to process image');
      return;
    }

    // create temp file
    final targetPath = (await getTemporaryDirectory()).path +
        "/images/${DateTime.now().millisecondsSinceEpoch}.jpg";
    final targetFile = File(targetPath);

    if (!await targetFile.exists()) {
      await targetFile.create(recursive: true);
    }

    // write compressed image to temp file
    await targetFile.writeAsBytes(imgCompress);

    // return if file size not valid
    if (await targetFile.length() < 1) {
      // dismiss loading
      Get.back();

      // show message failed to process image
      makeErrorSb('Failed', 'Failed to process image');
      return;
    }

    final reference = FirebaseStorage.instance
        .ref()
        .child('/files/${DateTime.now().millisecondsSinceEpoch}.jpg');

    // upload image
    late var resp;

    try {
      resp = await reference.putFile(targetFile);
    } on FirebaseException catch (_) {
      // dismiss loading
      Get.back();

      // show message failed to process image
      makeErrorSb('Failed', 'Failed to process image');

      state = state.copyWith(isDone: false);

      Get.back();

      return;
    }

    // if success, go back
    if (resp != null) {
      final url = await reference.getDownloadURL();

      state = state.copyWith(downloadUrl: url, isDone: true);

      print('state: $state');

      // dismiss loading
      Get.back();
      makeSuccessSb('Success', 'Image uploaded');
      Get.back();
    } else {
      // dismiss loading
      Get.back();
    }
  }
}
