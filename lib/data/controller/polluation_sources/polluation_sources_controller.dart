import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../domain/model/polluation_sources/polluation_sources_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/polluation_sources_service.dart';

class AllPolluationSourcesController extends GetxController {
  List<int> polluationSourcesIds = [];
  RxBool loading = true.obs;
  List<PolluationSourcesModel> allPolluationSources = [];
  List<MultiSelectItem<PolluationSourcesModel>> items = [];
  @override
  void onInit() {
    getAllPolluationSources();
    super.onInit();
  }

  void getAllPolluationSources() {
    PolluationSourcesServices.getPolluationSources().then((res) {
      //! success
      if (res.runtimeType == List<PolluationSourcesModel>) {
        loading.value = false;
        allPolluationSources = res;
        items = allPolluationSources
            .map((polluationSource) => MultiSelectItem<PolluationSourcesModel>(
                polluationSource, polluationSource.name))
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

  void getSelectedData(List<PolluationSourcesModel> dataList) {
    for (var data in dataList) {
      polluationSourcesIds.add(data.id);
    }
    update();
  }
}
