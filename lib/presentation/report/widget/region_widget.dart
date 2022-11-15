import 'package:enivronment/data/controller/location/governorate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/shared_widgets/bubbled_loader_widget.dart';
import '../../../data/controller/location/region_controller.dart';
import '../../resources/color_manager.dart';
import '../../resources/size_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class RegionWidget extends StatelessWidget {
  const RegionWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<GovernorateController>(
        init: GovernorateController(1),
        builder: (Governoratectx) {
          return GetX<RegionController>(
            init: RegionController(),
            builder: (controller) {
              return GestureDetector(
                  onTap: () {
                    if (controller.loading.value == false) {
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) => SizedBox(
                            height: SizeConfig.screenHeight! / MediaSize.m2_5,
                            child: ListView.builder(
                                itemCount: controller.allregion.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.onTapSelected(
                                          ctx,
                                          // wwe need pass it to Gov. getting list
                                          controller.allregion[index].id,

                                          controller.allregion[index].name);
                                          Governoratectx.getAllGovernorate(controller.allregion[index].id);

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
                                            controller.allregion[index].name,
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
                              Text(controller.regionText.value,
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
            }
          );
        });
  }
}
