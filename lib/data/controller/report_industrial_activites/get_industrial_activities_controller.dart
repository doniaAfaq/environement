import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../domain/model/report_industrial_activities/report_industrial_activities_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/industrial_activities_service.dart';

class AllIndustrialActivitiesController extends GetxController {
  RxBool loading = true.obs;
  List<int> industrialActivitiesIds = [];
  List<IndustrialActivitiesModel> allIndustrialActivities = [];
  List<MultiSelectItem<IndustrialActivitiesModel>> items = [];
  @override
  void onInit() {
    getAllIndustrialActivities();
    super.onInit();
  }

 

  void getAllIndustrialActivities() {
    IndustrialActivityServices.getAllIndustrialActivities().then((res) {
      //! success
      if (res.runtimeType == List<IndustrialActivitiesModel>) {
        loading.value = false;
        allIndustrialActivities = res;
        items = allIndustrialActivities
            .map((industrialActivity) =>
                MultiSelectItem<IndustrialActivitiesModel>(
                    industrialActivity, industrialActivity.name))
            .toList();
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

  void getSelectedData(List<IndustrialActivitiesModel> dataList) {
    for (var data in dataList) {
      industrialActivitiesIds.add(data.id);
    }
    update();
  }
}
