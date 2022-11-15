import 'package:get/get.dart';

enum GroundWaterRadio { yes, no }

class GroundWaterRadioController extends GetxController {
  GroundWaterRadio charcter = GroundWaterRadio.yes;

  void onChange(GroundWaterRadio value) {
    charcter = value;
    update();
  }
}
