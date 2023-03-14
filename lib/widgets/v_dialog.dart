import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/constant.dart';

uploadImageDialog(
    {Function(XFile)? onImgPick,
    Future<void>? onDone,
    bool showCamera = true}) {
  _pickImage(ImageSource imgSource) async {
    XFile? image = (await ImagePicker().pickImage(
      source: imgSource,
      imageQuality: 80,
    ));

    if (image != null) {
      await onImgPick?.call(image);
      print('profile update 1');
      await onDone;
      print('profile update 2');
    }
  }

  return Get.dialog(
    Dialog(
      backgroundColor: kDarkBlue,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Upload Profile Picture",
            ),
            const SizedBox(height: 16),
            if (showCamera)
              InkWell(
                onTap: () {
                  Get.back();
                  _pickImage(ImageSource.camera);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8,
                  ),
                  child: Text(
                    "Take Picture",
                  ),
                ),
              ),
            if (showCamera) const SizedBox(height: 16),
            InkWell(
              onTap: () {
                Get.back();
                _pickImage(ImageSource.gallery);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Text(
                  "Choose From Gallery",
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
