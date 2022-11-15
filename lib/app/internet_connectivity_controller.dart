import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../presentation/resources/color_manager.dart';

class InternetController extends GetxController {
  Future<bool> checkInternet() async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;

    if (hasInternet == false) {
      Get.snackbar(
        'Network Problem',
        "No Internet Connection",
        backgroundColor: ColorManager.error,
        colorText: ColorManager.white,
        icon:   Icon(
          Icons.error,
          color: ColorManager.white,
        ),
      );

      update();
      return false;
    }
    update();
    return true;
  }
}
