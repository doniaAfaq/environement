import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/internet_connectivity_controller.dart';
import '../../../domain/model/surface_water/surface_water_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/surface_water_service.dart';

class SurfaceWaterController extends GetxController {
  RxBool loading = true.obs;
  RxString surfaceWaterText = "Surface Water".tr.obs;
  RxInt surfaceWaterId = 0.obs;
  InternetController net = Get.find<InternetController>();
  void onTapSelected(BuildContext con, int id, String name) {
    surfaceWaterId.value = id;
    Navigator.pop(con);
    surfaceWaterText.value = name;
    update();
  }

  List<SurfaceWaterModel> allSurfaceWater = [];
  @override
  void onInit() {
    getSurfaceWater();
    super.onInit();
  }

  void getSurfaceWater() {
    net.checkInternet().then((value) {
      if (value) {
        SurfaceWaterService.getSurfaceWater().then((res) {
          //! success
          if (res.runtimeType == List<SurfaceWaterModel>) {
            loading.value = false;
            allSurfaceWater = res;
          } else if (res == 500) {
            //!Server Error
            loading.value = false;
            Get.defaultDialog(
              title: AppStrings.serverErrorTitle,
              middleText: AppStrings.serverError,
              onConfirm: () => Get.back(),
              confirmTextColor: ColorManager.white,
              buttonColor: ColorManager.error,
              backgroundColor: ColorManager.white,
            );
          } else if (res == 400) {
            loading.value = false;
            Get.defaultDialog(
              title: AppStrings.error,
              middleText: AppStrings.errorMsg,
              onConfirm: () => Get.back(),
              confirmTextColor: ColorManager.white,
              buttonColor: ColorManager.error,
              backgroundColor: ColorManager.white,
            );
          }
        });
      }
    });
  }
}
