import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../domain/model/industrial_polluation_sources/industrial_polluation_sources_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/industrial_polluation_sources_service.dart';

class AllIndustrialPolluationSourceController extends GetxController {
  List<int> industrialPolluationSourceIds = [];
  RxBool loading = true.obs;
  List<IndustrialPolluationSourcesModel> allIndustrialPolluationSource = [];
  List<MultiSelectItem<IndustrialPolluationSourcesModel>> items = [];
  @override
  void onInit() {
    getAllIndustrialPolluationSource();
    super.onInit();
  }

  void getAllIndustrialPolluationSource() {
    IndustrialPolluationSourceServices.getAllIndustrialPolluationSource()
        .then((res) {
      //! success
      if (res.runtimeType == List<IndustrialPolluationSourcesModel>) {
        loading.value = false;
        allIndustrialPolluationSource = res;
        items = allIndustrialPolluationSource
            .map((industrialPolluationSource) =>
                MultiSelectItem<IndustrialPolluationSourcesModel>(
                    industrialPolluationSource,
                    industrialPolluationSource.name))
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

  void getSelectedData(List<IndustrialPolluationSourcesModel> dataList) {
    for (var data in dataList) {
      industrialPolluationSourceIds.add(data.id);
    }
    update();
  }
}
