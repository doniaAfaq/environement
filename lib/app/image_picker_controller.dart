import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
 

class ImagePickerController extends GetxController {
 
  File image = File("");
  File image2 = File("");
  List<File> imagesList = [];
  List<List<File>> allImagesList = [];
  String errorr = 'No Error Dectected';


  
  Future pickImageFromCam() async {
    try {
      final imagefromCamera =
          await ImagePicker().pickImage(source: ImageSource.camera);

      final imageTemproray =
          imagefromCamera != null ? File(imagefromCamera.path) : File("");

      image = imageTemproray;
      update();
    } on PlatformException catch (e) {
      log("failed pick image $e");
    }
  }

  Future pickImageFromCam2() async {
    try {
      final imagefromCamera2 =
          await ImagePicker().pickImage(source: ImageSource.camera);

      final imageTemproray2 =
          imagefromCamera2 != null ? File(imagefromCamera2.path) : File("");

      image2 = imageTemproray2;
      update();
    } on PlatformException catch (e) {
      log("failed pick image2 $e");
    }
  }

  Future pickImageFromGallrey() async {
    try {
      final imagefromGallery =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      final imageTemproray =
          imagefromGallery != null ? File(imagefromGallery.path) : File("");

      image = imageTemproray;
      update();
    } on PlatformException catch (e) {
      log("failed pick image $e");
    }
  }

  Future pickImageFromGallrey2() async {
    try {
      final imagefromGallery2 =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      final imageTemproray2 =
          imagefromGallery2 != null ? File(imagefromGallery2.path) : File("");

      image2 = imageTemproray2;
      update();
    } on PlatformException catch (e) {
      log("failed pick image $e");
    }
  }

  Future pickImagesFormGallery(int index, List<dynamic> symptoms) async {
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

      allImagesList[index] = imagesList;
    } on PlatformException catch (e) {
      log("failed pick image $e");
    }
  }
}
