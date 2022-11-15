import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/internet_connectivity_controller.dart';
import '../../../domain/model/weather/weather_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/weather_service.dart';

class WeatherController extends GetxController {
  RxBool loading = true.obs;
  RxString weatherText = "Weather".tr.obs;
  RxInt weatherId = 0.obs;
  InternetController net = Get.find<InternetController>();
  void onTapSelected(BuildContext con, int id, String name) {
    weatherId.value = id;
    Navigator.pop(con);
    weatherText.value = name;
    update();
  }

  List<WeatherModel> allWeather = [];
  @override
  void onInit() {
    getWeather();
    super.onInit();
  }

  void getWeather() {
    net.checkInternet().then((value) {
      if (value) {
        WeatherService.getWeather().then((res) {
          //! success
          if (res.runtimeType == List<WeatherModel>) {
            loading.value = false;
            allWeather = res;
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
