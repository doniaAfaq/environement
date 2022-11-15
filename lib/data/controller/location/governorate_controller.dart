import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/internet_connectivity_controller.dart';
import '../../../domain/model/epicenter/epicenter_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/governorate_service.dart';

class GovernorateController extends GetxController {

  final int regionId;

  RxBool loading = true.obs;
 // RxString governorateText = 'Governorate'.tr.obs;
  RxString governorateText = 'Cities'.tr.obs;
  
  RxInt governorateId = 0.obs;
  InternetController net = Get.find<InternetController>();

  GovernorateController(this.regionId);

  void onTapSelected(BuildContext con, int id, String name) {
    governorateId.value = id;
    Navigator.pop(con);
    governorateText.value = name;
    update();
  }
/////////////////??????
  List<GovernorateModel> allGovernorate = [];
  @override
  void onInit() {
    getAllGovernorate(regionId);
    super.onInit();
  }

  void getAllGovernorate(int regionId ,) {
    print('region id :$regionId');
    net.checkInternet().then((value) {
      if (value) {
        GovernorateService.getGovernorate(regionId).then((res) {
          //! success
          if (res.runtimeType == List<GovernorateModel>) {
            loading.value = false;
            allGovernorate = res;
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
