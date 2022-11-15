import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/internet_connectivity_controller.dart';
import '../../../domain/model/land_form/land_form_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/land_form_service.dart';

class AllLandFormController extends GetxController {
  RxBool loading = true.obs;
  RxString landFormText ="Land Form ".tr.obs;
  RxInt landFormId = 0.obs; 
  InternetController net = Get.find<InternetController>();
  void onTapSelected(BuildContext con, int id, String name) {
    landFormId.value = id;
    Navigator.pop(con);
    landFormText.value = name;
    update();
  }

  List<LandFormModel> allLandForm = [];
  @override
  void onInit() {
    getAllLandForm();
    super.onInit();
  }

  void getAllLandForm() {
    net.checkInternet().then((value) {
      if (value) {
        AllLandForm.getAllLandForm().then((res) {
          //! success
          if (res.runtimeType == List<LandFormModel>) {
            loading.value = false;
            allLandForm = res;
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
