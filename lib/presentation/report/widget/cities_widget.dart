import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/shared_widgets/bubbled_loader_widget.dart';
import '../../../data/controller/location/cities_controller.dart';
import '../../resources/color_manager.dart';
import '../../resources/size_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class CitiesWidget extends StatelessWidget {
  const CitiesWidget({Key? key, required this.gocvernorateId})
      : super(key: key);
  final int gocvernorateId;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetX<CitiesController>(
        init: CitiesController(gocvernorateId),
        builder: (controller) {
          return GestureDetector(
              onTap: () {
                if (controller.loading.value == false) {
                  showModalBottomSheet(
                    context: context,
                    builder: (ctx) => SizedBox(
                        height: SizeConfig.screenHeight! / MediaSize.m2_5,
                        child: ListView.builder(
                            itemCount: controller.allCities.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  controller.onTapSelected(
                                      ctx,
                                      controller.allCities[index].id,
                                      controller.allCities[index].name);
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
                                        controller.allCities[index].name,
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
                          Text(controller.citiesText.value,
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
