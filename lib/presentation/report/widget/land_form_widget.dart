import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/shared_widgets/bubbled_loader_widget.dart';
import '../../../data/controller/land_form/land_form_controller.dart';
import '../../resources/color_manager.dart';
import '../../resources/size_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class LandFormWidget extends StatelessWidget {
  const LandFormWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetX<AllLandFormController>(
        init: AllLandFormController(),
        builder: (controller) {
          return GestureDetector(
              onTap: () {
                if (controller.loading.value == false) {
                  showModalBottomSheet(
                    context: context,
                    builder: (ctx) => SizedBox(
                        height: SizeConfig.screenHeight! / MediaSize.m2_5,
                        child: ListView.builder(
                            itemCount: controller.allLandForm.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  controller.onTapSelected(
                                      ctx,
                                      controller.allLandForm[index].id,
                                      controller.allLandForm[index].name);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppPadding.p60,
                                      vertical: AppPadding.p16),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: SizeConfig.screenHeight! /
                                        MediaSize.m12,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            BorderRadiusValues.br10),
                                        border: Border.all(
                                            width: AppSize.s1,
                                            color: ColorManager.grey)),
                                    child: Text(
                                        controller.allLandForm[index].name,
                                        style: getSemiBoldStyle(
                                            color: ColorManager.secondary)),
                                  ),
                                ),
                              );
                            })),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("please wait second".tr)));
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                margin: const EdgeInsets.only(
                    right: AppMargin.m30,
                    left: AppMargin.m30,
                    top: AppMargin.m20),
                alignment: Alignment.centerRight,
                height: SizeConfig.screenHeight! / MediaSize.m16,
                decoration: BoxDecoration(
                  border:
                      Border.all(width: AppSize.s1, color: ColorManager.grey),
                  borderRadius: BorderRadius.circular(BorderRadiusValues.br5),
                ),
                child: controller.loading.value == true
                    ? const BubbleLoader()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(controller.landFormText.value,
                              textAlign: TextAlign.center,
                              style: getSemiBoldStyle(
                                  color: ColorManager.secondary)),
                          const Spacer(),
                          Icon(
                            Icons.arrow_drop_down,
                            color: ColorManager.secondary,
                            size: AppSize.s30,
                          ),
                        ],
                      ),
              ));
        });
  }
}
