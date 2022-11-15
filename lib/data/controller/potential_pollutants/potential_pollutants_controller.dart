import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../domain/model/potential_pollutants/potential_pollutants_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/potential_pollutants_service.dart';

class AllPotentialPollutantsController extends GetxController {
  List<int> potentialPollutantsIds = [];
  RxBool loading = true.obs;
  List<PotentialPollutantsModel> allpotentialPollutants = [];
  List<MultiSelectItem<PotentialPollutantsModel>> items = [];
  @override
  void onInit() {
    getAllpotentialPollutants();
    super.onInit();
  }

  void getAllpotentialPollutants() {
    PotentialPollutantsService.getAllPotentialPollutants().then((res) {
      //! success
      if (res.runtimeType == List<PotentialPollutantsModel>) {
        loading.value = false;
        allpotentialPollutants = res;
        items = allpotentialPollutants
            .map((potentialPollutants) =>
                MultiSelectItem<PotentialPollutantsModel>(
                    potentialPollutants, potentialPollutants.name))
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

  void getSelectedData(List<PotentialPollutantsModel> dataList) {
    for (var data in dataList) {
      potentialPollutantsIds.add(data.id);
    }
    update();
  }
}
