import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EpicenterImagePickerController extends GetxController {
  List<File> imagesList = [];

  Future pickImagesFormGallery() async {
    try {
      List<XFile>? imagesFromGallery = await ImagePicker().pickMultiImage(
        maxHeight: 600,
        maxWidth: 600,
        imageQuality: 50,
      );

      for (var i = 0; i < imagesFromGallery!.length; i++) {
        imagesList.add(File(imagesFromGallery[i].path));

        update();
      }
    } on PlatformException catch (e) {
      log("failed pick image $e");
    }
  }
}
