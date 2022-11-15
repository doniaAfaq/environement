import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../domain/model/surrounding_buildings/surrounding_buildings_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/surrounding_buildings_service.dart';

class AllSurroundingBuildingsController extends GetxController {
   List<int> surroundingBuildingsIds = [];
  RxBool loading = true.obs;
  List<SurroundingBuildingsModel> allSurroundingBuildings = [];
  List<MultiSelectItem<SurroundingBuildingsModel>> items = [];
  @override
  void onInit() {
    getAllSurroundingBuildings();
    super.onInit();
  }

  void getAllSurroundingBuildings() {
    SurroundingBuildingsService.getAllSurroundingBuildingss().then((res) {
      //! success
      if (res.runtimeType == List<SurroundingBuildingsModel>) {
        loading.value = false;
        allSurroundingBuildings = res;
        items = allSurroundingBuildings
            .map((surroundingBuildings) =>
                MultiSelectItem<SurroundingBuildingsModel>(
                    surroundingBuildings, surroundingBuildings.name))
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
   void getSelectedData(List<SurroundingBuildingsModel> dataList) {
    for (var data in dataList) {
      surroundingBuildingsIds.add(data.id);
    }
    update();
  }
}
