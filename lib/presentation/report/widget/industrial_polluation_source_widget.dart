import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../app/shared_widgets/bubbled_loader_widget.dart';
import '../../../data/controller/report_industrial_polluation_source/industrial_polluation_source_controller.dart';
import '../../../domain/model/industrial_polluation_sources/industrial_polluation_sources_model.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class ReportIndustrialPolluationSourceWidget extends StatelessWidget {
  const ReportIndustrialPolluationSourceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: GetX<AllIndustrialPolluationSourceController>(
          init: AllIndustrialPolluationSourceController(),
          builder: (ctrl) {
            return MultiSelectDialogField(
              confirmText: Text(
                'ok'.tr,
                style: getSemiBoldStyle(color: ColorManager.secondary),
                overflow: TextOverflow.fade,
              ),
              cancelText: Text(
                'cancel'.tr,
                style: getSemiBoldStyle(color: ColorManager.secondary),
                overflow: TextOverflow.fade,
              ),
              items: ctrl.items,
              title: ctrl.loading.value == true
                  ? const BubbleLoader()
                  : Text("Industrial Polluation Source".tr),
              selectedColor: ColorManager.secondary,
              decoration: BoxDecoration(
                color: ColorManager.secondary.withOpacity(OpicityValue.o1),
                borderRadius: const BorderRadius.all(
                    Radius.circular(BorderRadiusValues.br10)),
                border: Border.all(
                  color: ColorManager.secondary,
                  width: AppSize.s2,
                ),
              ),
              buttonIcon: Icon(
                Icons.list,
                color: ColorManager.secondary,
              ),
              buttonText: Text(
                "Industrial Polluation Source".tr,
                style: getSemiBoldStyle(color: ColorManager.secondary),
              ),
              onConfirm: (List<IndustrialPolluationSourcesModel> results) {
                ctrl.getSelectedData(results);
              },
            );
          }),
    );
  }
}
