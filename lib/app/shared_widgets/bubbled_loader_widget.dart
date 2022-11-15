import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/values_manager.dart';

class BubbleLoader extends StatelessWidget {
  const BubbleLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingIndicator(
          indicatorType: Indicator.ballPulseSync,
          colors: [ColorManager.secondary],
          strokeWidth: AppSize.s1,
          backgroundColor: ColorManager.white.withOpacity(OpicityValue.o1),
          pathBackgroundColor: ColorManager.white.withOpacity(OpicityValue.o1)),
    );
  }
}
