import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class ReportRadioWidget extends StatelessWidget {
  const ReportRadioWidget({
    Key? key,
    required this.enumName,
    required this.yesValue,
    required this.onChangedYes,
    required this.noValue,
    required this.onChangedNo,
    required this.groupValue,
  }) : super(key: key);

  final dynamic enumName;
  final dynamic yesValue;
  final Function(dynamic) onChangedYes;
  final dynamic noValue;
  final Function(dynamic) onChangedNo;
  final dynamic groupValue;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Radio(
            activeColor: ColorManager.secondary,
            value: yesValue,
            groupValue: groupValue,
            onChanged: onChangedYes,
          ),
          Text(
            'yes'.tr,
            style: getSemiBoldStyle(color: ColorManager.secondary),
          ),
        ],
      ),
      Row(
        children: [
          Radio(
            activeColor: ColorManager.secondary,
            value: noValue,
            groupValue: groupValue,
            onChanged: onChangedNo,
          ),
          Text(
            'no'.tr,
            style: getSemiBoldStyle(color: ColorManager.secondary),
          ),
        ],
      ),
    ]);
  }
}
