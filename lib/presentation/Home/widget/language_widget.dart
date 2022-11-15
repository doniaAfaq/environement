import 'package:enivronment/data/controller/pagination_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/localization/app_lang_controller.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/size_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        shadowColor: ColorManager.white,
        backgroundColor: ColorManager.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios, color: ColorManager.primary),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //! title
          Text(
            "Choose Language".tr,
            style:
                getBoldStyle(color: ColorManager.black, fontSize: FontSize.s18),
          ),
          //!Languages
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p10, horizontal: AppPadding.p14),
            width: double.infinity,
            height: SizeConfig.screenHeight! / MediaSize.m1_8,
            child: GetBuilder<PaginationController>(
                init: PaginationController(),
                builder: (paginationCtrl) {
                  return GetBuilder<AppLanguage>(
                      init: AppLanguage(),
                      builder: (lang) {
                        return GridView.count(
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                lang.changeLanguage("ar");
                                Get.updateLocale(const Locale("ar"));
                                paginationCtrl.changeButtonDirection('ar');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(AppPadding.p10),
                                decoration: BoxDecoration(
                                    color: ColorManager.lightGrey,
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      ImageAssets.arabicLogo,
                                      width: SizeConfig.screenWidth! /
                                          MediaSize.m8,
                                      height: SizeConfig.screenHeight! /
                                          MediaSize.m8,
                                    ),
                                    Text(
                                      'arabic language'.tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary,
                                          fontSize: FontSize.s14),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                lang.changeLanguage("en");
                                Get.updateLocale(const Locale("en"));
                                paginationCtrl.changeButtonDirection('en');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(AppPadding.p10),
                                decoration: BoxDecoration(
                                    color: ColorManager.lightGrey,
                                    borderRadius: BorderRadius.circular(
                                        BorderRadiusValues.br10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      ImageAssets.englishLogo,
                                      width: SizeConfig.screenWidth! /
                                          MediaSize.m8,
                                      height: SizeConfig.screenHeight! /
                                          MediaSize.m8,
                                    ),
                                    Text(
                                      'english language'.tr,
                                      style: getSemiBoldStyle(
                                          color: ColorManager.secondary,
                                          fontSize: FontSize.s14),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                }),
          ),
        ],
      ),
    ));
  }
}
