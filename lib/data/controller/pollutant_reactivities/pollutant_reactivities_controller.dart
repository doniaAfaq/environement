import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/internet_connectivity_controller.dart';
import '../../../domain/model/pollutant_reactivities/pollutant_reactivities_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/pollutant_reactivities_service.dart';

class AllPollutantReactivitiesController extends GetxController {
  RxBool loading = true.obs;
  RxString pollutantReactivitiesText = "Pollutant Reactivities".tr.obs;
  RxInt pollutantReactivitiesId = 0.obs;
  InternetController net = Get.find<InternetController>();
  void onTapSelected(BuildContext con, int id, String name) {
    pollutantReactivitiesId.value = id;
    Navigator.pop(con);
    pollutantReactivitiesText.value = name;
    update();
  }

  List<PollutantReactivitiesModel> allPollutantReactivities = [];
  @override
  void onInit() {
    getAllPollutantReactivities();
    super.onInit();
  }

  void getAllPollutantReactivities() {
    net.checkInternet().then((value) {
      if (value) {
        PollutantReactivitiesService.getAllPollutantReactivities().then((res) {
          //! success
          if (res.runtimeType == List<PollutantReactivitiesModel>) {
            loading.value = false;
            allPollutantReactivities = res;
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
