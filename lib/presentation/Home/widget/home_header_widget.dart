
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_prefs.dart';
import '../../login/login_screen.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/size_manager.dart';
import '../../resources/values_manager.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          bottom: AppPadding.p8,
          top: AppPadding.p8,
          right: AppPadding.p14,
          left: AppPadding.p14),
      width: double.infinity,
      height: SizeConfig.screenHeight! / MediaSize.m10,
      color: ColorManager.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: SizeConfig.screenWidth! / MediaSize.m8_5,
            height: SizeConfig.screenHeight! / MediaSize.m17,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(ImageAssets.splashLogo),
            )),
          ),
          SizedBox(
              width: SizeConfig.screenWidth! / MediaSize.m8_5,
              height: SizeConfig.screenHeight! / MediaSize.m17,
              child: IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: ColorManager.error,
                ),
                onPressed: () {
                  SharedPreferencesHelper.clearToken();
                  Get.offAll(const LoginScreen());
                },
              ))
        ],
      ),
    );
  }
}
