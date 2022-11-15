import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/internet_connectivity_controller.dart';
import '../../../domain/model/pollutant_place/pollutant_place_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/pollutant_place_service.dart';

class PollutantPlaceController extends GetxController {
  RxBool loading = true.obs;
  RxString pollutantPlaceText = "Pollutant Places".tr.obs;
  RxInt pollutantPlaceId = 0.obs;
  InternetController net = Get.find<InternetController>();
  void onTapSelected(BuildContext con, int id, String name) {
    pollutantPlaceId.value = id;
    Navigator.pop(con);
    pollutantPlaceText.value = name;
    update();
  }

  List<PollutantPlaceModel> allPollutantPlace = [];
  @override
  void onInit() {
    getPollutantPlace();
    super.onInit();
  }

  void getPollutantPlace() {
    net.checkInternet().then((value) {
      if (value) {
        PollutantPlaceService.getPollutantPlace().then((res) {
          //! success
          if (res.runtimeType == List<PollutantPlaceModel>) {
            loading.value = false;
            allPollutantPlace = res;
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
