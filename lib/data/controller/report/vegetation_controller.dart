import 'package:get/get.dart';

enum VegetationRadio { yes, no }

class VegetationRadioController extends GetxController {
  VegetationRadio charcter = VegetationRadio.yes;

  void onChange(VegetationRadio value) {
    charcter = value;
    update();
  }
}
