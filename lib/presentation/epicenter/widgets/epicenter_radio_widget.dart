import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class NearstEpicenterRadioWidget extends StatelessWidget {
  const NearstEpicenterRadioWidget({
    Key? key,
    required this.enumName,
    required this.allValue,
    required this.onChangedAll,
    required this.notVisitedValue,
    required this.onChangedNotVisited,
    required this.groupValue,
    required this.visitedValue,
    required this.onChangedVisited,
  }) : super(key: key);

  final dynamic enumName;
  final dynamic allValue;
  final Function(dynamic) onChangedAll;
  final dynamic notVisitedValue;
  final Function(dynamic) onChangedNotVisited;
  final dynamic visitedValue;
  final Function(dynamic) onChangedVisited;
  final dynamic groupValue;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Radio(
            activeColor: ColorManager.secondary,
            value: allValue,
            groupValue: groupValue,
            onChanged: onChangedAll,
            splashRadius: AppSize.s12,
            toggleable : true,
          ),
          Text(
            'all'.tr,
            style: getSemiBoldStyle(color: ColorManager.secondary,fontSize: FontSize.s10),
          ),
        ],
      ),
      Row(
        children: [
          Radio(
            activeColor: ColorManager.secondary,
            value: notVisitedValue,
            groupValue: groupValue,
            onChanged: onChangedNotVisited,
             splashRadius: AppSize.s12,
              toggleable : true,
          ),
          Text(
            'Unvisited HotSpots'.tr,
             style: getSemiBoldStyle(color: ColorManager.secondary,fontSize: FontSize.s10),
          ),
        ],
      ),
      Row(
        children: [
          Radio(
            activeColor: ColorManager.secondary,
            value: visitedValue,
            groupValue: groupValue,
            onChanged: onChangedNotVisited,
             splashRadius: AppSize.s12,
              toggleable : true,
          ),
          Text(
            'Visited HotSpots'.tr,
             style: getSemiBoldStyle(color: ColorManager.secondary,fontSize: FontSize.s10),
          ),
        ],
      ),
    ]);
  }
}
