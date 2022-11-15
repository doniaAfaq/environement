import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

class ReportDividerWidget extends StatelessWidget {
  const ReportDividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppPadding.p32,
      left:AppPadding.p32 ,
      top:AppPadding.p10 ),
      child: Divider(
        thickness: AppSize.s1,
        color: ColorManager.grey1.withOpacity(OpicityValue.o3),
      ),
    );
  }
}
