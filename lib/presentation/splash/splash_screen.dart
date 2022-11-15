import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/app_prefs.dart';
import '../Home/home_screen.dart';
import '../login/login_screen.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/constants_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _lottieAnimation;
  var expanded = false;

  final transitionDuration =
      const Duration(seconds: AppConstants.splashAnimationDelay);

  int diffrenceBetweenExpireNow() {
    if (SharedPreferencesHelper.getExpireDateValue().isNotEmpty) {
      DateTime expireDate =
          DateTime.parse(SharedPreferencesHelper.getExpireDateValue());
      DateTime now = DateTime.now();
      int diff = expireDate.difference(now).inHours;
      return diff;
    } else {
      return 0;
    }
  }

  @override
  void initState() {
    _lottieAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: AppConstants.splashDelay),
    );

    Future.delayed(const Duration(seconds: AppConstants.splashDelay))
        .then((value0) => setState(() => expanded = true))
        .then((value1) => const Duration(seconds: AppConstants.splashDelay))
        .then(
          (value2) =>
              Future.delayed(const Duration(seconds: AppConstants.splashDelay))
                  .then(
            (value3) => _lottieAnimation.forward().then(
              (value4) {
                if (SharedPreferencesHelper.getTokenValue().isEmpty) {
                  Get.offAll(const LoginScreen());
                } else if (diffrenceBetweenExpireNow() <
                    AppConstants.expireDateTime) {
                  Get.offAll(const LoginScreen());
                } else {
                  Get.offAll(HomeScreen());
                }
              },
            ),
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        color: ColorManager.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              firstCurve: Curves.fastOutSlowIn,
              crossFadeState: !expanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: transitionDuration,
              firstChild: Container(),
              secondChild: Image.asset(
                ImageAssets.whiteLogo,
                width: 150,
                height: 150,
              ),
              alignment: Alignment.centerLeft,
              sizeCurve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }
}
