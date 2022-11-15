import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/internet_connectivity_controller.dart';
import '../../../domain/model/cities/cities_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/cities_service.dart';

class 
CitiesController extends GetxController {
  final int governorateId;

  RxBool loading = true.obs;
  RxString citiesText = 'Cities'.tr.obs;
  RxInt citiesId = 0.obs;
  InternetController net = Get.find<InternetController>();

  CitiesController(this.governorateId);

  void onTapSelected(BuildContext con, int id, String name) {
    citiesId .value = id;
    Navigator.pop(con);
    citiesText .value = name;
    update();
  }

  List<CitiesModel> allCities = [];
  @override
  void onInit() {
    getAllCities(governorateId);
    super.onInit();
  }

  void getAllCities(int governorateId) {
    net.checkInternet().then((value) {
      if (value) {
        CitiesService.getCities(governorateId).then((res) {
          //! success
          if (res.runtimeType == List<CitiesModel>) {
            loading.value = false;
            allCities = res;
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
