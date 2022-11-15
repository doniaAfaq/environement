
import 'package:enivronment/domain/model/epicenter/all-epicenter-model.dart';
import 'package:get/get.dart';

import '../../../domain/model/epicenter/epicenter_model.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../network/all_epicenter_service.dart';

class AllEpicenterController extends GetxController {
  RxBool loading = true.obs;
  RxList<EpicenterModel> allEpicenter = <EpicenterModel>[].obs;
  RxString totalItem = '1'.obs ;
  RxInt pageNumber = 1.obs;
  // final AllEpicenterModel allEpicenterModel = AllEpicenterModel(epicenterModel: [], totalItems: '');

  @override
  void onInit() {
    getAllEpicenter(1);
    super.onInit();
  }

   changPageNum(int pageNum){

    // update();
    getAllEpicenter(pageNum);
    pageNumber.value = pageNum;
    update();
    // print("donia");
    // print(pageNumber.value);
  }

  void getAllEpicenter(int pageNumber, [int cityId = 0]) async{

    // print("getAllEpicenter:$pageNumber");
    // print(loading.value);
    loading.value = true;
    AllEpicenterServices.getAllEpicenter(pageNumber).then((res) {
      print("getAllEpicenter:$pageNumber");
      //! success
      if (res[0].runtimeType == List<EpicenterModel>) {
        loading.value = false;
        allEpicenter.value = res[0];
        totalItem.value = res[1];

        // print('totalItem= $totalItem');
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


}
